#!/bin/sh

# Globally disable globbing and enable exit-on-error.
set -ef

# Required environment variables.
workspace_id="${WORKSPACE_ID:?Please set the WORKSPACE_ID environment variable and run the script again.}"

api_endpoint="https://app.terraform.io/api/v2/workspaces/${workspace_id}/actions/safe-delete"
# shellcheck disable=SC2154
set -- --header "Authorization: Bearer ${TF_TOKEN_app_terraform_io}" --header "Content-Type: application/vnd.api+json"
set -- "$@" --silent --request POST
curl "$@" "${api_endpoint}"
