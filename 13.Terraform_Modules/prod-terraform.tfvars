//provider.tf
region     = "ap-south-1"
access_key = ""                     // export TF_VAR_access_key=
secret_key = "" // export TF_VAR_secret_key=

//key-pair.tf
key_name = "prod-Terraform-SSH-Key"

//sg.tf
sg_name          = "prod-Terraform-SG"
sg_ingress_ports = [22,443,80, 3000]

//instance.tf
instance_type = "t2.micro"
