---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# Provisioners

- TF Provisiorners are used to execute scripts or commands on a resource after it has been created. Provisioners can be used to configure and bootstrap resources after creation.There are two types of provisioners in Terraform:

- Local-exec provisioners: Executes a command locally on the machine running Terraform.
- Remote-exec provisioners: Executes a command on a remote resource, typically after it has been created.


### Why to use  ? 

- Provisioners may require specific software or tools to be installed on the local machine or remote resource, which can introduce additional dependencies to the Terraform code. For example, if you need to install software on a resource using a provisioner, you may need to have that software installed on the local machine running Terraform or the remote resource. This can make it harder to manage and test the code, especially when you are working with multiple cloud providers or environments.

### Possibility of Performance issues

- Provisioners can be slow, especially when running on remote resources. This can cause delays in the provisioning process and impact the overall performance of your infrastructure.Provisioners can also impact the performance of the local machine running Terraform, as they may consume significant resources when executing. This can impact your ability to work on other tasks while Terraform is running.

### **Reliability**

Provisioners can fail or cause errors, especially when running on remote resources that may be slow or unstable. This can cause issues with your infrastructure and require manual intervention to resolve. Provisioners can also cause issues with the ordering of resource creation, which can lead to unpredictable results. If a provisioner fails or causes an error, you may need to rerun the entire Terraform configuration, which can be time-consuming and impact your productivity.



## Creation-Time Provisioners

- Provisioners run when the resource they are defined within is created. Creation-time provisioners are only run during creation, not during updating or any other lifecycle. They are meant as a means to perform bootstrapping of a system.
- If a creation-time provisioner fails, the resource is marked as **tainted**. A tainted resource will be planned for destruction and recreation upon the next `terraform apply`. Terraform does this because a failed provisioner can leave a resource in a semi-configured state. Because Terraform cannot reason about what the provisioner does, the only way to ensure proper creation of a resource is to recreate it. This is tainting.
- You can change this behavior by setting the `on_failure` attribute to `continue`. Refer to [Failure Behavior](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax#failure-behavior) for additional information.

## Destroy-Time Provisioners

If `when = destroy` is specified, the provisioner will run when the resource it is defined within is _destroyed_.

```
resource "aws_instance" "web" {
  # …

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Destroy-time provisioner'"
  }
}
```

Destroy provisioners are run before the resource is destroyed. If they fail, Terraform will error and rerun the provisioners again on the next `terraform apply`. Due to this behavior, care should be taken for destroy provisioners to be safe to run multiple times.

Destroy-time provisioners can only run if they remain in the configuration at the time a resource is destroyed. If a resource block with a destroy-time provisioner is removed entirely from the configuration, its provisioner configurations are removed along with it and thus the destroy provisioner won't run. To work around this, a multi-step process can be used to safely remove a resource with a destroy-time provisioner:

- Update the resource configuration to include `count = 0`.
- Apply the configuration to destroy any existing instances of the resource, including running the destroy provisioner.
- Remove the resource block entirely from configuration, along with its `provisioner` blocks.
- Apply again, at which point no further action should be taken since the resources were already destroyed.

Because of this limitation, you should use destroy-time provisioners sparingly and with care.
