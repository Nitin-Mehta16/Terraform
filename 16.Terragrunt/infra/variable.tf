variable "environment" {
  description = "value of environment"
  type        = string
  default     = "default"
  # validation {
  #   condition     = contains(["dev", "prod"], var.environment)
  #   error_message = "Environment must be either dev or prod"
  # }
}
variable "region" {
  description = "region applicable for the instance"
  type        = string
  # default     = "us-east-1"
  validation {
    condition     = contains(["us-east-1", "ap-south-1"], var.region)
    error_message = "Region must be either us-east-1 or ap-south-1"
  }
}
# variable "ami_id" {
#   description = "ami id"
#   type        = map(string)
#   # default = {
#   #   "us-west-1" = "ami-west-0c55b159cbfafe1f0"
#   #   "us-east-1" = "ami-east-0c55b159cbfafe1f0"
#   # }
# }

# variable "instance_name" {
#   description = "value of instance name"
#   type        = list(string)
#   # default     = ["dev-server", "prod-server"]
# }

variable "key_path" {
  description = "check key exist or not"
  type        = string
  # default     = "./key.pub"
  validation {
    condition     = fileexists(var.key_path)
    error_message = "key file does not exist. Make sure key exist in the ${path.cwd} directory"
  }
}

variable "private_key_path" {
  description = "check key exist or not"
  type        = string
  # default     = "./key.pub"
  validation {
    condition     = fileexists(var.private_key_path)
    error_message = "key file does not exist. Make sure key exist in the ${path.cwd} directory"
  }
}

variable "ports" {
  description = "value of port"
  type        = any
}

variable "deploy_script" {
  description = "script for deployment"
  type        = string
  default     = "./deploy.sh"
  validation {
    condition     = fileexists(var.deploy_script)
    error_message = "deploy script not in location -->   ${path.cwd}"
  }
}

variable "project_folder" {
  description = "project folder name"
  type        = string
  default     = "../src/"
}

variable "project_destination" {
  description = "project destination folder"
  type        = string
  default     = "/var/www/html/"
}

variable "project_name" {
  description = "name of the project"
  type        = string
  default     = "prject-name"
}