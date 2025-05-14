// Creating security group
resource "aws_security_group" "Terraform-SG" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = var.sg_ingress_ports
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

  dynamic "egress" {
    for_each = [1] // 1 is used to create a single egress rule
    iterator = port
    content {
      from_port   = 0 //from_port and to_port values are ignored — AWS treats this as "all traffic on all ports.
      to_port     = 0
      protocol    = "-1" // all protocols
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
  tags = {
    Name = "Terraform-SG"
  }
}

output "sucurity_group_id" {
  value       = aws_security_group.Terraform-SG.id
  description = "Security group id"

}

