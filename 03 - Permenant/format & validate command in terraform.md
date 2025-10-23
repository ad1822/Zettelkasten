---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# Format & Validate

Terraform `format` and `validate` are two essential commands for maintaining clean and correct Terraform configurations:

- `terraform fmt` automatically formats Terraform configuration files to a consistent style. It adjusts indentation, aligns arguments, and sorts blocks and arguments. This command helps maintain code readability and consistency across team projects.
    
- `terraform validate` checks the syntax and internal consistency of Terraform configurations. It verifies that the configuration is syntactically valid, references are correct, and attribute names and types are appropriate. This command catches errors early in the development process, before attempting to apply changes to infrastructure.


# Command: validate

The `terraform validate` command validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc.

Validate runs checks that verify whether a configuration is syntactically valid and internally consistent, regardless of any provided variables or existing state. It is thus primarily useful for general verification of reusable modules, including correctness of attribute names and value types.

It is safe to run this command automatically, for example as a post-save check in a text editor or as a test step for a reusable module in a CI system.

Validation requires an initialized working directory with any referenced plugins and modules installed. To initialize a working directory for validation without accessing any configured backend,


# Command: fmt

The `terraform fmt` command is used to rewrite Terraform configuration files to a canonical format and style. This command applies a subset of the [Terraform language style conventions](https://developer.hashicorp.com/terraform/language/style#code-formatting), along with other minor adjustments for readability.

Other Terraform commands that generate Terraform configuration will produce configuration files that conform to the style imposed by `terraform fmt`, so using this style in your own files will ensure consistency.

The canonical format may change in minor ways between Terraform versions, so after upgrading Terraform we recommend to proactively run `terraform fmt` on your modules along with any other changes you are making to adopt the new version.

We don't consider new formatting rules in `terraform fmt` to be a breaking change in new versions of Terraform, but we do aim to minimize changes for configurations that are already following the style examples shown in the Terraform documentation. When adding new formatting rules, they will usually aim to apply more of the rules already shown in the configuration examples in the documentation, and so we recommend following the documented style even for decisions that `terraform fmt` doesn't yet apply automatically.

Formatting decisions are always subjective and so you might disagree with the decisions that `terraform fmt` makes. This command is intentionally opinionated and has no customization options because its primary goal is to encourage consistency of style between different Terraform codebases, even though the chosen style can never be everyone's favorite.

We recommend that you follow the style conventions applied by `terraform fmt` when writing Terraform modules, but if you find the results particularly objectionable then you may choose not to use this command, and possibly choose to use a third-party formatting tool instead. If you choose to use a third-party tool then you should also run it on files that are generated automatically by Terraform, to get consistency between your hand-written files and the generated files.

## Usage

Usage: `terraform fmt [options] [target…]`

By default, the `terraform fmt` command scans your current directory for configuration files. You can also provide a `target` argument to tell `terraform fmt` to scan:

- A directory
- A specific file
- Standard input by supplying a single dash (`-`).

The `terraform fmt` command accepts the following arguments.

| Flag           | Description                                                                                                                                                                                                       | Required |
| :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------- |
| `-list=false`  | Prevents the command from listing the files containing formatting inconsistencies.                                                                                                                                | Optional |
| `-diff`        | Displays the diffs of formatting changes.                                                                                                                                                                         | Optional |
| `-write=false` | Prevents the command from overwriting files. This behavior is implied by the `-check` flag or if the input is from `STDIN`.                                                                                       | Optional |
| `-check`       | Checks if the input is formatted. The exit status is `0` if the command's input is properly formatted. Otherwise, the exit status is non-zero, and the command outputs a list of improperly formatted file names. | Optional |
| `-recursive`   | Processes files in subdirectories in addition to the current directory. By default, the command only processes the specified, or current, directory.                                                              | Optional |
