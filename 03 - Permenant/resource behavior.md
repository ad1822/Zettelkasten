---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# Resource Behavior

- A `resource` block declares that you want a particular infrastructure object to exist with the given settings. If you are writing a new configuration for the first time, the resources it defines will exist _only_ in the configuration, and will not yet represent real infrastructure objects in the target platform.

- _Applying_ a Terraform configuration is the process of creating, updating, and destroying real infrastructure objects in order to make their settings match the configuration.


## How Terraform Applies a Configuration

- When Terraform creates a new infrastructure object represented by a `resource` block, the identifier for that real object is saved in Terraform's [state](https://developer.hashicorp.com/terraform/language/state), allowing it to be updated and destroyed in response to future changes. For resource blocks that already have an associated infrastructure object in the state, Terraform compares the actual configuration of the object with the arguments given in the configuration and, if necessary, updates the object to match the configuration.

- _Create_ resources that exist in the configuration but are not associated with a real infrastructure object in the state.
- _Destroy_ resources that exist in the state but no longer exist in the configuration.
- _Update in-place_ resources whose arguments have changed.
- _Destroy and re-create_ resources whose arguments have changed but which cannot be updated in-place due to remote API limitations.

## Local-only Resources

- While most resource types correspond to an infrastructure object type that is managed via a remote network API, there are certain specialized resource types that operate only within Terraform itself, calculating some results and saving those results in the state for future use.
- For example, local-only resource types exist for [generating private keys](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key), [issuing self-signed TLS certificates](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert), and even [generating random ids](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id). While these resource types often have a more marginal purpose than those managing "real" infrastructure objects, they can be useful as glue to help connect together other resources.
- The behavior of local-only resources is the same as all other resources, but their result data exists only within the Terraform state. "Destroying" such a resource means only to remove it from the state, discarding its data.
