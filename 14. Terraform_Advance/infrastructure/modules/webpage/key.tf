resource "aws_key_pair" "terraform-key" {
  key_name   = "${local.prefix}-terraform-key"
  public_key = file(var.key_path)
}