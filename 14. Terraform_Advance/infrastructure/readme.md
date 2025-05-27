<!-- BEGIN_TF_DOCS -->
# Terraform Advanced

## This folder contains advance topics of terraform.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.98.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.98.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.server](https://registry.terraform.io/providers/hashicorp/aws/5.98.0/docs/resources/instance) | resource |
| [aws_key_pair.terraform-key](https://registry.terraform.io/providers/hashicorp/aws/5.98.0/docs/resources/key_pair) | resource |
| [aws_security_group.terraform_sg](https://registry.terraform.io/providers/hashicorp/aws/5.98.0/docs/resources/security_group) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/5.98.0/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deploy_script"></a> [deploy\_script](#input\_deploy\_script) | script for deployment | `string` | `"./deploy.sh"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | value of instance name | `list(string)` | n/a | yes |
| <a name="input_key_path"></a> [key\_path](#input\_key\_path) | check key exist or not | `string` | n/a | yes |
| <a name="input_ports"></a> [ports](#input\_ports) | value of port | `any` | n/a | yes |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | check key exist or not | `string` | n/a | yes |
| <a name="input_project_destination"></a> [project\_destination](#input\_project\_destination) | project destination folder | `string` | `"/var/www/html/"` | no |
| <a name="input_project_folder"></a> [project\_folder](#input\_project\_folder) | project folder name | `string` | `"../src"` | no |
| <a name="input_region"></a> [region](#input\_region) | region applicable for the instance | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key-name"></a> [key-name](#output\_key-name) | n/a |
| <a name="output_public-ip"></a> [public-ip](#output\_public-ip) | n/a |
| <a name="output_sg-name"></a> [sg-name](#output\_sg-name) | n/a |

## Issues/Imporvement -:
- implement module

### Thank You for reading this file😄.
<!-- END_TF_DOCS -->