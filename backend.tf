terraform {
  backend "s3" {
    bucket         = "703951826048-ca-central-1-terraform-state"
    dynamodb_table = "703951826048-ca-central-1-terraform-state-locks"
    key            = "tfe-infrastructure.tfstate"
    encrypt        = true
    kms_key_id     = "alias/aws/s3"
    region         = "ca-central-1"
  }
}
