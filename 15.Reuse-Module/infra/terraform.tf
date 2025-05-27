module "create_ec2" {
  source              = "../../14. Terraform_Advance/infrastructure/modules/webpage"
  environment         = var.environment
  key_path            = var.key_path
  private_key_path    = var.private_key_path
  ports               = var.ports
  deploy_script       = var.deploy_script
  project_folder      = var.project_folder
  project_destination = var.project_destination
  project_name        = var.project_name
}