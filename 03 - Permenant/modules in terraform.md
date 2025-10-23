---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# Modules

- Terraform modules are reusable components that encapsulate a set of resources, their configurations, and their interconnections. They allow for organizing Terraform code into logical, self-contained units that can be shared and reused across different projects or within the same project.
- Modules promote code reusability, maintainability, and consistency in infrastructure deployments. They can accept input variables, produce output values, and be nested within other modules.
- By using modules, teams can create standardized infrastructure components, enforce best practices, and simplify complex configurations. Modules can be sourced from local directories, version control systems, or public registries like the Terraform Registry.
- Effective use of modules can significantly reduce code duplication, improve infrastructure management, and enable the creation of scalable, maintainable Terraform configurations.


- Modules are containers from multiple resources that are used together. A module consites of a collection of `.tf` and /or `.tf.json` files kept together in a directory.
- Modules are the main way to package and reuse resource configuration with TF.


## The Root Module

- Every TF configuration has at least one module, knows as its *root module*, which consists of the resources defined in the `.tf` files in the main working directory.


## The Child Module

- A TF module can call other modules to include their resources into the configuration. A module that has been called by another module is often referred to as a child module.
- Child modules can be called multiple times within the same configuration, and multiple configurations can use the same child module.

## Published Modules Usage

- Using published modules in Terraform involves incorporating pre-built, often community-contributed modules into your infrastructure code. These modules are typically available through the Terraform Registry or other version control systems. They provide ready-made configurations for common infrastructure components, saving time and promoting best practices. To use a published module, you specify its source (usually a URL or registry path) and version in your Terraform configuration.
- You can then configure the module by passing input variables. Published modules can range from simple resource wrappers to complex, multi-resource configurations. They offer benefits like reduced development time, standardized implementations, and community-tested solutions. However, it’s important to review and understand any published module before using it in production environments to ensure it meets your specific requirements and security standards.
