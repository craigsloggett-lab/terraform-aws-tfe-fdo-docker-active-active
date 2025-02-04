module "tfe_fdo_docker_active_active" {
  source  = "app.terraform.io/craigsloggett-lab/tfe-fdo-docker-active-active/aws"
  version = "0.1.2"

  tfe_license                = "LICENSE"
  tfe_version                = "v202501-1"
  route53_zone_name          = "craig-sloggett.sbx.hashidemos.io"
  ec2_bastion_ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDEYtDnLmY9nus0dhQm1GlIVSQB7BswxGYnugA8Ag9JA"

  providers = {
    aws    = aws
    http   = http
    random = random
  }
}
