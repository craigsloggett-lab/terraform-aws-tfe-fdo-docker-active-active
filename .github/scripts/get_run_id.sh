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

# Set GitHub output to reuse this value in downstream checks.
echo "run-id=${run_id}" >>"${GITHUB_OUTPUT}"
