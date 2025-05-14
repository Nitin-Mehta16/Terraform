provider "github" {  
    token = ""
}

resource "github_repository" "name_in_local_machine" {
  name        = "Terraform-Automation"
  description = "Repository created by Terraform"
  visibility  = "public"
  auto_init   = true
}

//"name_in_local_machine" is the resource name in your Terraform config. 
//This is how Terraform identifies and tracks this resource internally (in state files, for example).


//terraform providers --> see all the providers you have installed
//terraform init --> It installs the provider plugins (like github, aws, etc.) specified in your .tf files. 
//                   Without this step, Terraform doesn’t know how to talk to GitHub, AWS, etc.
//                  /.terraform/providers/registry.terraform.io/hashicorp/github/6.6.0/windows_amd64/terraform-provider-github_v6.6.0.exe
//terraform plan
//terraform apply 


resource "github_repository" "Terraform-Automation" {
  name        = "Terraform-Automation2"
  description = "2nd Repository created by Terraform"
  visibility  = "public"
  auto_init   = true
}

//terraform detroy --target github_repository.Terraform-Automation