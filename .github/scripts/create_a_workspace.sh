#!/bin/sh

# Globally disable globbing and enable exit-on-error.
set -ef

# Required environment variables.
commit_sha="${COMMIT_SHA:?Please set the COMMIT_SHA environment variable and run the script again.}"

# Trim the commit SHA to look like the commits shown in a PR conversation.
short_commit_sha=$(printf '%s\n' "${commit_sha}" | cut -c1-7)
# Derive values from the GitHub workflow environment variables.
workspace_name="${GITHUB_REPOSITORY#*/}-${short_commit_sha}"
source_url="${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}"

# TODO: Get this from the Terraform configuration.
project_id="prj-3rGi6Mb5Pzm4UXf8"
terraform_version="1.10.3"
org="craigsloggett-lab"

cat <<EOF >payload.json
{
  "data": {
    "type": "workspace",
    "attributes": {
      "name": "${workspace_name}",
      "source-name": "GitHub Actions",
      "source-url": "${source_url}",
      "terraform-version": "${terraform_version}"
    },
    "relationships": {
      "project": {
        "data": {
          "type": "projects",
          "id": "${project_id}"
        }
      }
    }
  }
}
EOF

api_endpoint="https://app.terraform.io/api/v2/organizations/${org}/workspaces"

# shellcheck disable=SC2154
set -- --header "Authorization: Bearer ${TF_TOKEN_app_terraform_io}" --header "Content-Type: application/vnd.api+json"
set -- "$@" --silent --request POST --data @payload.json
# shellcheck disable=SC2034
workspace_id="$(curl "$@" "${api_endpoint}" | jq -r '.data.id')"
