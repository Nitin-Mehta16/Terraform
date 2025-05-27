resource "aws_security_group" "terraform_sg" {
  name        = "${local.prefix}-terraform-sg"
  description = "Allow  inbound traffic and all outbound traffic"



  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      from_port        = port.value.port
      to_port          = try(port.value.to_port, port.value.port)
      protocol         = "tcp"
      cidr_blocks      = port.value.cidr
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.prefix}-terraform-sg"
  }
}

