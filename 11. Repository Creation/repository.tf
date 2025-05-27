output "owner_of_the_github" {
  value = "Hello, my name is ${var.github_owner} and I am owner of this GitHub account"
  
}
resource "github_repository" "Fist_repo_created_by_terraform" {
  name        = "Terraform-Automation_1"
  description = "1st Repository created by Terraform"
  visibility  = "public"
  auto_init   = true
  
}

resource "github_repository" "Second_repo_created_by_terraform" {
  name        = "Terraform-Automation_2"
  description = "2nd Repository created by Terraform"
  visibility  = "public"
  auto_init   = true
  
}

output "Repository_url" {
  value = github_repository.Fist_repo_created_by_terraform.git_clone_url
}

//terraform validate --> to check everything is wokring fine or not 
//terraform output owner_of_the_github--> print output
