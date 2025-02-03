#!/bin/sh

# Globally disable globbing and enable exit-on-error.
set -ef

# Required environment variables.
workspace_name="${WORKSPACE_NAME:?Please set the WORKSPACE_NAME environment variable and run the script again.}"

# TODO: Get this from the Terraform configuration.
org="craigsloggett-lab"

cat <<EOF >backend.tf
terraform {
  cloud {
    organization = "${org}"

    workspaces {
      project = "Modules"
      name    = "${workspace_name}"
    }
  }
}
EOF
