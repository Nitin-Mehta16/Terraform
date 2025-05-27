output "sg-name" {
  value = aws_security_group.terraform_sg.name
}

output "key-name" {
  value = aws_key_pair.terraform-key.key_name
}

output "public-ip" {
  value = aws_instance.server.public_ip
  # value = [for value in aws_instance.server : value.public_ip]

}