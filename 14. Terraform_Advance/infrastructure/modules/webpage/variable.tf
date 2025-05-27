variable"environment" {
  description = "value of environment"
  type        = string
}


variable "key_path" {
  description = "check key exist or not"
  type        = string

  validation {
    condition     = fileexists(var.key_path)
    error_message = "key file does not exist. Make sure key exist in the ${path.cwd} directory"
  }
}

variable "private_key_path" {
  description = "check key exist or not"
  type        = string

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
}

variable "project_destination" {
  description = "project destination folder"
  type        = string
}

variable "project_name" {
  description = "name of the project"
  type        = string
}

variable "instance_type" {
  description = "type of the instance"
  type        = string
}