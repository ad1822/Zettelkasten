---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# File Structure

```
├── main.tf
├── variables.tf
├── outputs.tf
```


#### Other files 

- [`terraform.tfstate`](https://developer.hashicorp.com/terraform/tutorials/modules/module-create#terraform-tfstate) and `terraform.tfstate.backup`: These files contain your Terraform state, and are how Terraform keeps track of the relationship between your configuration and the infrastructure provisioned by it.
- [`.terraform`](https://developer.hashicorp.com/terraform/tutorials/modules/module-create#terraform): This directory contains the modules and plugins used to provision your infrastructure. These files are specific to a specific instance of Terraform when provisioning infrastructure, not the configuration of the infrastructure defined in `.tf` files.
- [`*.tfvars`](https://developer.hashicorp.com/terraform/tutorials/modules/module-create#tfvars): Since module input variables are set via arguments to the `module` block in your configuration, you don't need to distribute any `*.tfvars` files with your module, unless you are also using it as a standalone Terraform configuration.
