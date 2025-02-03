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

get_run_status() {
  set -- --header "Authorization: Bearer ${TF_TOKEN_app_terraform_io}" --header "Content-Type: application/vnd.api+json"
  set -- "$@" --silent --request GET
  curl "$@" "${api_endpoint}" | jq -r '.data.attributes.status'
}

run_status="$(get_run_status)"
printf '%s\n' "Run Status: ${run_status}"

while [ "${run_status}" != 'canceled' ]; do
  sleep 10
  run_status="$(get_run_status)"
  printf '%s\n' "Run Status: ${run_status}"
done
