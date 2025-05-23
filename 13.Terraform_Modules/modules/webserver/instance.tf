// Creating EC2 instance
resource "aws_instance" "Terraform-Instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.Terraform-SG.name]
  key_name        = aws_key_pair.Terraform-SSH-Key.key_name
  tags = {
    Name = "Terraform-Instance"
  }
  user_data = file("${path.module}/script.sh")


  connection { // this connection block is global for all provisioners
    type        = "ssh"
    user        = "ubuntu"
    private_key = var.private_key
    host        = self.public_ip // host != aws_instance.Terraform-Instance.public_ip  --> because it will stuck in infinite loop
  }

  provisioner "remote-exec" {
    script = "${path.module}/remote_script.sh"
  }


}