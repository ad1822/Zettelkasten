---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# State

- Tracks the current state of infra.
- It's typically stored in a file named `terraform.tfstate`, which maps real-world resources to configuration.
- This state allows TF to determine which changes are necessary to archieve the desired configuration.
- It contains sensitive information and should be stored securely, often in remote backends like S3 or TF cloud.
- The state can be manipulated using terraform state commands for tasks like moving resources between states or removing resources from management. Proper state management is essential for collaborative work, ensuring consistency across team members and enabling Terraform to accurately plan and apply changes to your infrastructure.


- The primary purpose of Terraform state is to store bindings between objects in a remote system and resource instances declared in your configuration. When Terraform creates a remote object in response to a change of configuration, it will record the identity of that remote object against a particular resource instance, and then potentially update or delete that object in response to future configuration changes.
