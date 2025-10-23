---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# Local Values
A local value assigns a name to an [expression](https://developer.hashicorp.com/terraform/language/expressions), so you can use the name multiple times within a module instead of repeating the expression.

## Declaring a Local Value

A set of related local values can be declared together in a single `locals` block:

```
locals {
  service_name = "forum"
  owner        = "Community Team"
}
```

The expressions in local values are not limited to literal constants; they can also reference other values in the module in order to transform or combine them, including variables, resource attributes, or other local values:

```
locals {
  # Ids for multiple sets of EC2 instances, merged together
  instance_ids = concat(aws_instance.blue.*.id, aws_instance.green.*.id)
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }
}
```

## Ephemeral values

Local values implicitly become ephemeral if you reference an ephemeral value when you assign that local a value. For example, you can create a local that references an ephemeral `service_token`.

```
variable "service_name" {
  type    = string
  default = "forum"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "service_token" {
  type      = string
  ephemeral = true
}

locals {
  service_tag   = "${var.service_name}-${var.environment}"
  session_token = "${var.service_name}:${var.service_token}"
}
```

The `local.session_token` value is implicitly ephemeral because it relies on an ephemeral variable.


## When To Use Local Values

Local values can be helpful to avoid repeating the same values or expressions multiple times in a configuration, but if overused they can also make a configuration hard to read by future maintainers by hiding the actual values used.k

Use local values only in moderation, in situations where a single value or result is used in many places _and_ that value is likely to be changed in future. The ability to easily change the value in a central place is the key advantage of local values.


### **1. `locals` vs. `variable` - Key Differences**

|Feature|`locals`|`variable` (from `variables.tf`)|
|---|---|---|
|**Purpose**|Stores reusable values within a module|Defines user-configurable values for reusability|
|**Scope**|Local to the module|Can be set externally (via CLI, `.tfvars`, or environment variables)|
|**Mutability**|Fixed within the module (cannot be overridden)|Can be overridden by users|
|**Usage**|Used for computed or derived values|Used for user-defined inputs|

---

### **2. When to Use `locals` vs. `variable`**

- **Use `locals`** when you want to store computed values or constants within a module.
- **Use `variable`** when you want flexibility and allow users to override values.

---

### **3. Example Comparison**

#### **Using `locals` (for computed/internal values)**


```yaml
locals {
  environment = "dev"
  region      = "us-east-1"
  tags = {
    Name        = "my-app-${local.environment}"
    Environment = local.environment
  }
}
```
🔹 **Cannot be overridden externally.**  
🔹 **Best for derived or constant values within a module.**

### **5. Summary**

| Use Case                                | `locals` | `variable` |
| --------------------------------------- | -------- | ---------- |
| Fixed, derived, or computed values      | ✅ Yes    | ❌ No       |
| Can be overridden externally            | ❌ No     | ✅ Yes      |
| Used within a module for internal logic | ✅ Yes    | ❌ No       |
| Passed as input for modules/providers   | ❌ No     | ✅ Yes      |
