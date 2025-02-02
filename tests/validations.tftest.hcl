variables {
  tfe_version                = "v202501-1"
  route53_zone_name          = "craig-sloggett.sbx.hashidemos.io"
  ec2_bastion_ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDEYtDnLmY9nus0dhQm1GlIVSQB7BswxGYnugA8Ag9JA"
}

run "validate_plan" {
  command = plan
}
