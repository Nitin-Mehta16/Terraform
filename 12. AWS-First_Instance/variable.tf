//provider.tf
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}
variable "access_key" {
  description = "The AWS access key"
  type        = string
}
variable "secret_key" {
  description = "The AWS secret key"
  type        = string
}


//key-pair.tf
variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}

//sg.tf
variable "sg_name" {
  description = "The name of the security group"
  type        = string
  
}
variable "sg_ingress_ports" {
  description = "The list of ports for ingress rules"
  type        = list(number)
}

//instance.tf

# variable "ami" {
#   description = "The AMI ID for the EC2 instance"
#   type        = string
# }

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
}


