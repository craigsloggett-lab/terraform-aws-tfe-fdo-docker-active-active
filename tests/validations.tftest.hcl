variables {
  route53_zone_name          = "craig-sloggett.sbx.hashidemos.io"
  ec2_bastion_ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDEYtDnLmY9nus0dhQm1GlIVSQB7BswxGYnugA8Ag9JA"
}

run "validate_plan" {
  command = plan
}

run "validate_plan_2" {
  command = plan

  variables {
    route53_zone_name          = "craig-sloggett.sbx.hashidemos.io"
    ec2_bastion_ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDEYtDnLmY9nus0dhQm1GlIVSQB7BswxGYnugA8Ag9JA"
    tfe_subdomain              = "tfe_testing"
  }
}
