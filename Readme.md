# Terraform Documentation 

⦁	.tf files (configuration) --> This is your desired state — what you want your infrastructure to look like.
⦁	 .tfstate file (current state) --> This is Terraform’s knowledge of what is currently deployed. 



⦁	terraform providers 

⦁	terraform init

⦁	terraform validate

⦁	terraform plan -> compare .tfstate with resources

🔄 What happens during terraform plan:
1. Load the current state from .tfstate.
2. Compare the resources defined in your .tf files with the state.
3. Query the real infrastructure (cloud provider) to ensure the state is accurate.
4. Show you the delta:
    What will be added(+), changed(-+), destroyed(-), modify(~) to match .tf.

✅ It does not apply any changes, only shows what would happen if you run apply.


⦁	terraform apply --auto-approve

⦁	terraform destroy --target github_repository.Second_repo_created_by_terraform

⦁	terrfarom destroy  


⦁	terraform refresh --> update Terraform's state file with the real-world state of infrastructure.

⦁	 terraform refresh is only needed to update state if resources have changed outside of Terraform (like someone editing an EC2 instance manually in AWS).

*** Running terraform plan after terraform refresh can help you see differences caused by other developers or changes outside Terraform, without actually applying anything yet. ***

⦁	terraform output owner_of_the_github--> print output

⦁	terraform console-> console of pwd

⦁	terraform fmt -->correct indendation

⦁	terraform taint  -->  it will replace the resource , means it will delete it and then recreate it. ***TERRAFORM DOES NOT RECOMMENT TAINT***
~ terraform taint aws_instance.Terraform-Instance

⦁	terraform graph | dot -Tpdf > graph_pdf.pdf --> give graph of structure

⦁	terraform graph | dot -Tsvg > graph_svg.svg --> give svg of structure

***TERRAFORM WORKSPACE***
⦁	When we use more than one  .tfvars like -:
       ~ terraform plan --var-file dev-terraform.tfvars
       ~ terraform plan --var-file prod-terraform.tfvars
    to avoid change in same .tfstate file we create workflow 

⦁	It provide individual workspace for each infrastructure. No need to write whole file from start.


⦁	terraform workspace list  -> list of workspace 

⦁	terraform workspace new  dev  -> create new workspace

⦁	terraform workspace new prod

⦁	terraform workspace select  prod  --> change workspace

⦁	Terraform workspace delete prod  --> delete workspace 

***Terraform Backend with state locking using Dynamo DB***
⦁	Add backend block in terraform block with bucket name (bucket), region(region), file to backup(key), dynamo table (dynamodb_table ).

***MIGRATION OF .tfstate FILE***
⦁	Comment backend tfstate  file code 
⦁	terraform init -migrate-state --> copy remote tfstate to local storage

***Realtime Problem Face in Terraform***
⦁	1st -> Created different workspaces |  Problem --> Make changes in terraform.tfvars for every workspace and sometime forget ot change workspace.
⦁	2nd -> Created different .tfvars file + different workspaces | Problem --> Forget to add --var-file  orchange workspace.
⦁	3rd -> Creted different folder for every environment,no need of workspace.  | Problem -->  Duplication of Code 

⦁***4th Terragrunt***
  - terragrunt init 
  - terragrunt plan
  - terraggrunt run-all init
  - terraggrunt run-all plan
  - terragrunt run-all apply 
  - terragrunt run-all destroy














