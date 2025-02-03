#!/bin/sh

# Globally disable globbing and enable exit-on-error.
set -ef

# Required environment variables.
WORKSPACE_ID="${WORKSPACE_ID:?Please set the WORKSPACE_NAME environment variable and run the script again.}"
TFE_LICENSE="${TFE_LICENSE:?Please set the TFE_LICENSE environment variable and run the script again.}"

cat <<EOF >payload.json
{
  "data": {
    "attributes": {
      "message": "Destroying ephemeral resources after integration tests.",
      "is-destroy": "true",
      "variables": [
        {
          "key": "tfe_license",
          "value": "\"${TFE_LICENSE}\""
        }
      ]
    },
    "type":"runs",
    "relationships": {
      "workspace": {
        "data": {
          "type": "workspaces",
          "id": "${WORKSPACE_ID}"
        }
      }
    }
  }
}
EOF

api_endpoint="https://app.terraform.io/api/v2/runs"

# shellcheck disable=SC2154
set -- --header "Authorization: Bearer ${TF_TOKEN_app_terraform_io}" --header "Content-Type: application/vnd.api+json"
set -- "$@" --silent --request POST --data @payload.json
curl "$@" "${api_endpoint}" | jq
