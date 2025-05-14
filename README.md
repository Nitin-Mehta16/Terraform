⦁	.tf files (configuration) --> This is your desired state — what you want your infrastructure to look like.
⦁	 .tfstate file (current state) --> This is Terraform’s knowledge of what is currently deployed. 



⦁	terraform providers 

⦁	terraform init

⦁	terraform validate

⦁	terraform plan -> compare .tfstate with resources

🔄 What happens during terraform plan:
Load the current state from .tfstate.
2. Compare the resources defined in your .tf files with the state.
3. Query the real infrastructure (cloud provider) to ensure the state is accurate.
4. Show you the delta:
What will be added, changed, or destroyed to match .tf.

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

⦁	

