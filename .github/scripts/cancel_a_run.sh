#!/bin/sh

# Globally disable globbing and enable exit-on-error.
set -ef

# Required environment variables.
run_id="${RUN_ID:?Please set the RUN_ID environment variable and run the script again.}"

cat <<EOF >payload.json
{
  "comment": "This run was cancelled to facilitate a newer commit."
}
EOF

api_endpoint="https://app.terraform.io/api/v2/runs/${run_id}/actions/cancel"
# shellcheck disable=SC2154
set -- --header "Authorization: Bearer ${TF_TOKEN_app_terraform_io}" --header "Content-Type: application/vnd.api+json"
set -- "$@" --silent --request POST --data @payload.json
curl "$@" "${api_endpoint}" | jq
