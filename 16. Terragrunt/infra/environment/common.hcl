terraform{
source= "git::https://github.com/Nitin-Mehta16/Terraform-modules.git//webpage"
}

generate "provider" {
    path = "./provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
                    provider "aws" {
                        region = var.region

                    }
                EOF
}

# remote_state  {
#     backend = "s3"
#     config = {
#         bucket         = "nitin-terraform-state11"
#         key            = "${path_relative_to_include()}/terraform.tfstate"
#         region         = "ap-south-1"
#         # dynamodb_table = "nitin-terraform-lock"
#     }
#      generate= {
#        path = "backend.tf"
#        if_exists = "overwrite_terragrunt"
#      }
# }

inputs = {
    # environment  = "dev"
    # region       = "ap-south-1"
    project_name = "portfolio"
    key_path = "${get_parent_terragrunt_dir()}/key.pub"
    private_key_path = "${get_parent_terragrunt_dir()}/key"
    # ports = [
    #     {
    #     port = 22
    #     cidr = ["0.0.0.0/0"]
    #     }, {
    #     port = 80
    #     cidr = ["0.0.0.0/0"]
    #     }, {
    #     port = 443
    #     cidr = ["0.0.0.0/0"]
    #     }, {
    #     port    = 3000
    #     to_port = 3005
    #     cidr    = ["0.0.0.0/0"]
    #     }
    #     ]
    # deploy_script       = "${get_parent_terragrunt_dir()}./deploy.sh"
    # project_folder      = "${get_parent_terragrunt_dir()}/../src/"
    # project_destination = "/var/www/html/"
    # instance_type = "t2.micro"
}