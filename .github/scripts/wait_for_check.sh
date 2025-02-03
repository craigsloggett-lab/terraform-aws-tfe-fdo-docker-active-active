#!/bin/sh

# Globally disable globbing and enable exit-on-error.
set -ef

# Required environment variables.
COMMIT_SHA="${COMMIT_SHA:?Please set the COMMIT_SHA environment variable and run the script again.}"

owner="craigsloggett-lab"
repo="terraform-aws-tfe-fdo-docker-active-active"

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${GITHUB_TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/${owner}/${repo}/commits//check-runs"
