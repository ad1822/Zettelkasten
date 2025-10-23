---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# Plan

`terraform plan` is a command that creates an execution plan, showing what changes Terraform will make to your infrastructure. It compares the current state with the desired state defined in configuration files and outputs a detailed list of resources to be created, modified, or deleted. Importantly, it doesn’t make any actual changes to infrastructure, instead helping identify potential issues before applying changes. The plan can be saved to a file for later execution or review. This command is crucial for reviewing changes before implementation, especially in complex environments, and is commonly used in code reviews and CI/CD pipelines to validate proposed infrastructure modifications. While terraform plan provides a preview, it’s worth noting that it can’t always predict every change due to external factors or API limitations.


By default, When Terraform creates a plan it:
- Reads the current state of any already-existing remote objects to make sure that the Terraform state is up-to-date.
- Compares the current configuration to the prior state and noting any differences.
- Proposes a set of change actions that should, if applied, make the remote objects match the configuration
