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

  //provisioner --> used for executing command from local machine to remote instance --> (not recommanded)
  //type of provisioner --> file, local-exec, remote-exec 
  provisioner "file" {
    source      = "README.md"
    destination = "/home/ubuntu/README.md"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/id_rsa")
      host        = self.public_ip // host != aws_instance.Terraform-Instance.public_ip  --> because it will stuck in infinite loop
    }

  }
  //when ever provisioner fails, .tfstate will mark it's resource(here-> instance) as tainted and once it run successfully it will be marked as untainted
  //Provisioners only run on creation: If the resource is already created and not being replaced, the provisioner will not run. 
  //Terraform doesn't rerun provisioners on existing infrastructure by default.


  connection { // this connection block is global for all provisioners
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip // host != aws_instance.Terraform-Instance.public_ip  --> because it will stuck in infinite loop
  }

  provisioner "file" {
    content     = "Hey, this for testing purpose"
    destination = "/home/ubuntu/Test.md"
  }

  provisioner "file" {
    source      = "test_folder"
    destination = "/home/ubuntu/"
  }

  provisioner "local-exec" {
    working_dir = "./"
    command     = "echo ${self.public_ip} > ip.txt"
  }

  provisioner "local-exec" {
    interpreter = ["python3", "-c"]
    command     = "print('Hello from local-exec provisioner')"
  }

  provisioner "local-exec" {
    working_dir = "./"
    interpreter = ["bash", "-c"]
    command     = "echo $MY_ENV_VAR >> ip.txt"
    environment = {
      MY_ENV_VAR = "Hello from enviroment variable"
    }
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo instance is destroying"
    # command = "exit 1"
  }


}







output "public_ip" {
  value       = aws_instance.Terraform-Instance.public_ip
  description = "Public IP of the instance"

}