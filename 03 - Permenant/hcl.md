---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# HCL

- HCL, or HashiCorp Configuration Language, is a human-readable language for DevOps tools. It is used to code infrastructure management and service orchestration in a clear and manageable way.

- Terraform uses HCL to provision and manage cloud resources efficiently. Its clear syntax and structure are instrumental in creating resource modules and configurations .
- This low-level syntax of the Terraform language is defined in terms of a syntax called _HCL_, which is also used by configuration languages in other applications, and in particular other HashiCorp products.
- It is not necessary to know all of the details of HCL syntax in order to use Terraform, and so this page summarizes the most important details. If you are interested, you can find a full definition of HCL syntax in [the HCL native syntax specification](https://github.com/hashicorp/hcl/blob/main/hclsyntax/spec.md).

## Arguments and Blocks

The Terraform language syntax is built around two key syntax constructs: arguments and blocks.

### Arguments

An _argument_ assigns a value to a particular name:

```
image_id = "abc123"
```

The identifier before the equals sign is the _argument name_, and the expression after the equals sign is the argument's value.


### Blocks

A _block_ is a container for other content:

```
resource "aws_instance" "example" {
  ami = "abc123"

  network_interface {
    # ...
  }
}
```

A block has a _type_ (`resource` in this example). Each block type defines how many _labels_ must follow the type keyword. The `resource` block type expects two labels, which are `aws_instance` and `example` in the example above. The `aws_instance` label is specific to the AWS provider. It specifies the `resource` type that Terraform provisions when you apply the configuration. The second label is an arbitrary name that you can add to the particular instance of the resource. You can create multiple instances of the same block type and differentiate them by giving each instance a unique name. In this example, the Terraform configuration author assigned the `example` label to this instance of the `aws_instance` resource. A particular block type may have any number of required labels, or it may require none as with the nested `network_interface` block type.


## Identifiers

Argument names, block type names, and the names of most Terraform-specific constructs like resources, input variables, etc. are all _identifiers_.

Identifiers can contain letters, digits, underscores (`_`), and hyphens (`-`). The first character of an identifier must not be a digit, to avoid ambiguity with literal numbers.

For complete identifier rules, Terraform implements [the Unicode identifier syntax](http://unicode.org/reports/tr31/), extended to include the ASCII hyphen character `-`.
