// Creating ssh key pair
resource "aws_key_pair" "Terraform-SSH-Key" {
  key_name   = var.key_name
  public_key = var.public_key
  tags = {
    Name = "Terraform-SSH-Key"
  }
}
