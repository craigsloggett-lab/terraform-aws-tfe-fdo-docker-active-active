terraform {
  required_version = "~> 1.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}
