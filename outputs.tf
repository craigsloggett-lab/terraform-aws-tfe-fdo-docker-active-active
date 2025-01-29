output "ec2_bastion_instance_type_availability" {
  description = "Show the list of Availability Zones that the configured EC2 instance type is available in."
  value       = { for az, details in data.aws_ec2_instance_type_offering.bastion : az => details.instance_type }
}

output "ec2_tfe_instance_type_availability" {
  description = "Show the list of Availability Zones that the configured EC2 instance type is available in."
  value       = { for az, details in data.aws_ec2_instance_type_offering.tfe : az => details.instance_type }
}
