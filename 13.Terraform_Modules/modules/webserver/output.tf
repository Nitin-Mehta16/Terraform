output "public_ip" {
  value       = aws_instance.Terraform-Instance.public_ip
  description = "Public IP of the instance"
}

output "ssh-key_name" {
  value       = aws_key_pair.Terraform-SSH-Key.key_name
  description = "SSH key name"
}

output "sucurity_group_id" {
  value       = aws_security_group.Terraform-SG.id
  description = "Security group id"
}