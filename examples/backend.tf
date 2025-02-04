terraform {
  cloud {
    organization = "craigsloggett-lab"

    workspaces {
      project = "Platform Team"
      name    = "terraform-aws-tfe-fdo-docker-active-active"
    }
  }
}
