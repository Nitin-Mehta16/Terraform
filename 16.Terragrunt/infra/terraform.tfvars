environment  = "dev"
region       = "ap-south-1"
project_name = "portfolio"
# instance_name = ["frontend-server", "backend-server"]

# ami_id = {
#   "ap-south-1" = "ami-0e35ddab05955cf57"
#   "us-east-1"  = "ami-084568db4383264d4"
# }

key_path = "./key.pub"

private_key_path = "./key"

ports = [{
  port = 22
  cidr = ["0.0.0.0/0"]
  }, {
  port = 80
  cidr = ["0.0.0.0/0"]
  }, {
  port = 443
  cidr = ["0.0.0.0/0"]
  }, {
  port    = 3000
  to_port = 3005
  cidr    = ["0.0.0.0/0"]
}]

deploy_script       = "./deploy.sh"
project_folder      = "../src/"
project_destination = "/var/www/html/"