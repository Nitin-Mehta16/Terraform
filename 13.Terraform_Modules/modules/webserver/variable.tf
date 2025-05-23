variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair to use for the instance."
  type        = string
}

variable "sg_name" {
  description = "The name of the security group."
  type        = string
}

variable "sg_ingress_ports" {
  type = list(number)
}

variable "ami" {
  description = "The AMI ID to use for the instance."
  type        = string
}

variable "public_key" {
  description = "The public key to use for the SSH key pair."
  type        = string
}

variable "private_key" {
  description = "The private key to use for the SSH key pair."
  type        = string 
}
