---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# Init

- The `terraform init` command initializes a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control. It is safe to run this command multiple times.

## Usage

Usage: `terraform init [options]`

This command performs several different initialization steps in order to prepare the current working directory for use with Terraform. More details on these are in the sections below, but in most cases it is not necessary to worry about these individual steps.

This command is always safe to run multiple times, to bring the working directory up to date with changes in the configuration. Though subsequent runs may give errors, this command will never delete your existing configuration or state.


## Backend Initialization

- During init, the root configuration directory is consulted for [backend configuration](https://developer.hashicorp.com/terraform/language/backend) and the chosen backend is initialized using the given configuration settings.
- Re-running init with an already-initialized backend will update the working directory to use the new backend settings. Either `-reconfigure` or `-migrate-state` must be supplied to update the backend configuration.
