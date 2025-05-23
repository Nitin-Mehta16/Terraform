output "public_ip" {
  value       = module.create_ec2_instannce.public_ip
  description = "Public IP of the instance"
}

output "ssh-key_name" {
  value       = module.create_ec2_instannce.ssh-key_name
  description = "SSH key name"
}

output "sucurity_group_id" {
  value       = module.create_ec2_instannce.sucurity_group_id
  description = "Security group id"
}