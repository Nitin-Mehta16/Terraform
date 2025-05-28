include {
    path = find_in_parent_folders("common.hcl")
}

inputs = {
    environment  = "dev"
    instance_type       = "t2.micro"
    region       = "ap-south-1"

    ports = [
        {
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
        }
        ]
    deploy_script       = "${get_parent_terragrunt_dir()}/deploy.sh"
    project_folder      = "${get_parent_terragrunt_dir()}/../../src/"
    project_destination = "/var/www/html/"
    
}