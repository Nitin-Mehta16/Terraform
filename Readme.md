
# 📘 Terraform Documentation

---

- `.tf` files (configuration) → This is your desired state — what you want your infrastructure to look like.  
- `.tfstate` file (current state) → This is Terraform’s knowledge of what is currently deployed.  

---

### 🔧 Terraform Core Commands

- `terraform providers`  
- `terraform init`  
- `terraform validate`  
- `terraform plan` → compare `.tfstate` with resources  

---

### 🔄 What happens during `terraform plan`

1. Load the current state from `.tfstate`.  
2. Compare the resources defined in your `.tf` files with the state.  
3. Query the real infrastructure (cloud provider) to ensure the state is accurate.  
4. Show you the delta:
    - What will be added `+`,  
    - Changed `-+`,  
    - Destroyed `-`,  
    - Modified `~` to match `.tf`.

✅ It does **not apply** any changes, only shows what would happen if you run `apply`.

---

### 🛠️ Other Terraform Commands

- `terraform apply --auto-approve`  
- `terraform destroy --target github_repository.Second_repo_created_by_terraform`  
- `terraform destroy`  

---

### 🔁 Refresh Terraform State

- `terraform refresh` → update Terraform's state file with the real-world state of infrastructure.  
- `terraform refresh` is only needed if resources have changed **outside of Terraform** (like someone editing an EC2 instance manually in AWS).

> ##### 🔍 Running `terraform plan` after `terraform refresh`  
> Helps you see differences caused by other developers or manual changes without actually applying anything yet.

---

### 📤 Outputs & Console

- `terraform output owner_of_the_github` → print output  
- `terraform console` → console of pwd  
- `terraform fmt` → correct indentation  

---

### ⚠️ Terraform Taint

- `terraform taint` → replaces the resource (delete + recreate)  

> ### ⚠️ TERRAFORM DOES NOT RECOMMEND TAINT

```bash
terraform taint aws_instance.Terraform-Instance
```

---

### 📈 Terraform Graph

```bash
terraform graph | dot -Tpdf > graph_pdf.pdf   # give PDF graph of structure
terraform graph | dot -Tsvg > graph_svg.svg   # give SVG graph of structure
```

---

## 🧱 TERRAFORM WORKSPACE

- When we use more than one `.tfvars` like:

```bash
terraform plan --var-file=dev-terraform.tfvars
terraform plan --var-file=prod-terraform.tfvars
```

- To avoid changes in the same `.tfstate` file, we create workflows.  
- It provides **individual workspaces** for each infrastructure.  
- No need to write the whole file from scratch.

### Workspace Commands

- `terraform workspace list` → list of workspaces  
- `terraform workspace new dev` → create new workspace  
- `terraform workspace new prod`  
- `terraform workspace select prod` → change workspace  
- `terraform workspace delete prod` → delete workspace  

---

## ☁️ Terraform Backend with State Locking (DynamoDB)

- Add backend block in `terraform` block with:
  - `bucket` (name),
  - `region`,
  - `key` (file path),
  - `dynamodb_table` (lock management).

---

## 🔄 MIGRATION OF `.tfstate` FILE

- Comment backend `.tfstate` file code  
- Run:

```bash
terraform init -migrate-state   # copy remote tfstate to local storage
```

---

## 🐛 Realtime Problems Faced in Terraform

1. **Created different workspaces**  
   **Problem:** Need to make changes in `terraform.tfvars` for every workspace, and sometimes forget to switch workspace.

2. **Created different `.tfvars` file + different workspaces**  
   **Problem:** Forget to add `--var-file` or change workspace.

3. **Created different folder for every environment, no need for workspace**  
   **Problem:** Duplication of code.

4. **Terragrunt**
   ```bash
   terragrunt init  
   terragrunt plan  
   terragrunt run-all init  
   terragrunt run-all plan  
   terragrunt run-all apply  
   terragrunt run-all destroy  
   ```

---
