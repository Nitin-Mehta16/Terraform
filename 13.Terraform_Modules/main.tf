module "create_ec2_instannce" {
  source           = "./modules/webserver"
  instance_type    = var.instance_type
  key_name         = var.key_name
  sg_name          = var.sg_name
  sg_ingress_ports = var.sg_ingress_ports
  ami              = data.aws_ami.ami-resource.id
  public_key       = file("${path.module}/id_rsa.pub")
  private_key      = file("${path.module}/id_rsa")
}

