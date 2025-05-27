locals {
  environment = try(var.environment,terraform.workspace)
  tags = {
    Name = "${var.project_name}-${local.environment}"
  }
  prefix = var.project_name
}
resource "aws_instance" "server" {
  ##  meta arguments

  #   count         = 5
  # count = length(var.instance_name)   #if new instance is added in behin of the list it will act normal and will add just one instance  eg. -> [1,2] + [3] => [1,2,3]
  #                                     #but if we add new instance in between or in middle it will first replace then add last one  eg. -> [3] +[1,2] => change name of 1 ->3 , 2->1, and will create new 2
  # for_each = toset(var.instance_name) # data type -> map or set(unnique values) 

  # instance_type = local.environment == "dev" ? "t2.micro" : "t2.small"
  instance_type = var.instance_type
  #ami           = var.ami_id[var.region]
  ami = try(data.aws_ami.ubuntu.id, "ami-0e35ddab05955cf57")

  key_name = aws_key_pair.terraform-key.key_name

  security_groups = [aws_security_group.terraform_sg.name]

  tags = local.tags
  # tags = {
  #   # Name = "MyInstance-${count.index+1}"
  #   # Name = var.instance_name[count.index]
  #   Name = each.key
  # }
  # user_data = file(var.deploy_script)

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    script = var.deploy_script
  }
  provisioner "file" {
    source      = var.project_folder
    destination = var.project_destination
  }
}