---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# Output Values
- Output values make information about your infrastructure available on the command line, and can expose information for other Terraform configurations to use. Output values are similar to return values in programming languages.

- A child module can use outputs to expose a subset of its resource attributes to a parent module.
- A root module can use outputs to print certain values in the CLI output after running `terraform apply`.
- When using [remote state](https://developer.hashicorp.com/terraform/language/state/remote), root module outputs can be accessed by other configurations via a [`terraform_remote_state` data source](https://developer.hashicorp.com/terraform/language/state/remote-state-data).


## Declaring an Output Value

Each output value exported by a module must be declared using an `output` block:

```
output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}
```

The label immediately after the `output` keyword is the name, which must be a valid [identifier](https://developer.hashicorp.com/terraform/language/syntax/configuration#identifiers). In a root module, this name is displayed to the user; in a child module, it can be used to access the output's value.

The `value` argument takes an [expression](https://developer.hashicorp.com/terraform/language/expressions) whose result is to be returned to the user. In this example, the expression refers to the `private_ip` attribute exposed by an `aws_instance` resource defined elsewhere in this module (not shown). Any valid expression is allowed as an output value.

## Accessing Child Module Outputs

In a parent module, outputs of child modules are available in expressions as `module.<MODULE NAME>.<OUTPUT NAME>`. For example, if a child module named `web_server` declared an output named `instance_ip_addr`, you could access that value as `module.web_server.instance_ip_addr`.

## Custom Condition Checks

You can use `precondition` blocks to specify guarantees about output data. 

```yaml
output "api_base_url" {
  value = "https://${aws_instance.example.private_dns}:8433/"

  # The EC2 instance must have an encrypted root volume.
  precondition {
    condition     = data.aws_ebs_volume.example.encrypted
    error_message = "The server's root volume is not encrypted."
  }
}
```

Custom conditions can help capture assumptions, helping future maintainers understand the configuration design and intent. They also return useful information about errors earlier and in context, helping consumers more easily diagnose issues in their configurations.


## Optional Arguments

`output` blocks can optionally include `description`, `sensitive`, `ephemeral`, and `depends_on` arguments, which are described in the following sections.


### `sensitive` — Suppressing Values in CLI Output

An output can be marked as containing sensitive material using the optional `sensitive` argument:

```yaml
output "db_password" {
  value       = aws_db_instance.db.password
  description = "The password for logging in to the database."
  sensitive   = true
}
```

Terraform will hide values marked as sensitive in the messages from `terraform plan` and `terraform apply`. In the following scenario, our root module has an output declared as sensitive and a module call with a sensitive output, which we then use in a resource attribute.

