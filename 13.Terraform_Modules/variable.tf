//provider.tf
variable "region" {
  description = "The AWS region to deploy the resources in."
  type        = string
}
variable "access_key" {
  description = "The AWS access key."
  type        = string
}
variable "secret_key" {
  type = string
}


// modules/webserver
variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
}
variable "key_name" {
  description = "The name of the SSH key pair."
  type        = string
}
variable "sg_name" {
  description = "The name of the security group."
  type        = string
}
variable "sg_ingress_ports" {
  description = "The list of ports for ingress rules."
  type        = list(number)
}
