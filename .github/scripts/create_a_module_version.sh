#!/bin/sh

set -e

version="${1}"
commit_sha="${2}"

cat <<EOF >payload.json
{
  "data": {
    "type": "registry-module-versions",
    "attributes": {
      "version": "${version}",
      "commit-sha": "${commit_sha}"
    }
  }
}
EOF

# TODO: Get these from the Terraform configuration.
org="craigsloggett-lab"
module="tfe-fdo-docker-active-active"
provider="aws"

api_endpoint="https://app.terraform.io/api/v2/organizations/${org}/registry-modules/private/${org}/${module}/${provider}/versions"
# shellcheck disable=SC2154
set -- --header "Authorization: Bearer ${TF_TOKEN_app_terraform_io}" --header "Content-Type: application/vnd.api+json"
set -- "$@" --silent --request POST --data @payload.json
curl "$@" "${api_endpoint}"
