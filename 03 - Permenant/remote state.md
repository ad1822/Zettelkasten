---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# Remote State

- Terraform stores state locally in a file named `terraform.tfstate`. When working with Terraform in a team, use of a local file makes Terraform usage complicated because each user must make sure they always have the latest state data before running Terraform and make sure that nobody else runs Terraform at the same time.

- With remote state, TF writes the state data to a remote data store, which can then be shared between all members of a team. TF supports storing state in HCP TF, HashiCorp Consul, S3

- Remote state is implemented by a [backend](https://developer.hashicorp.com/terraform/language/backend) or by HCP Terraform, both of which you can configure in your configuration's root module.
