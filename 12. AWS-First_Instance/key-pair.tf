// Creating ssh key pair
resource "aws_key_pair" "Terraform-SSH-Key" {
  key_name   = var.key_name
  public_key = file("${path.module}/id_rsa.pub")
}
output "ssh-key_name" {
  value       = aws_key_pair.Terraform-SSH-Key.key_name
  description = "SSH key name"
}