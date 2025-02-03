#!/bin/sh

# Globally disable globbing and enable exit-on-error.
set -ef

# Required environment variables.
log_file="${LOG_FILE:?Please set the LOG_FILE environment variable and run the script again.}"

run_line=$(grep '/runs/run-' "${log_file}" | head -n 1)

# If no matching line is found, exit with an error.
if [ -z "${run_line}" ]; then
  echo "Error: Could not find a line containing '/runs/run-' in ${log_file}" >&2
  exit 1
fi

run_id=${run_line##*/runs/}

cat <<EOF >payload.json
{
  "comment": "This run was cancelled to facilitate a newer commit."
}
EOF

api_endpoint="https://app.terraform.io/api/v2/runs/${run_id}"
# shellcheck disable=SC2154
set -- --header "Authorization: Bearer ${TF_TOKEN_app_terraform_io}" --header "Content-Type: application/vnd.api+json"
set -- "$@" --silent --request POST --data @payload.json
curl "$@" "${api_endpoint}/actions/cancel" | jq

for i in 1 2 3 4 5; do
  set -- --header "Authorization: Bearer ${TF_TOKEN_app_terraform_io}" --header "Content-Type: application/vnd.api+json"
  curl "$@" "${api_endpoint}" | jq -r '.data.attributes.status'
  sleep 30
  printf '%s\n' "$i"
done
