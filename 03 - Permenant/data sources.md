---
cssclasses:
  - center-images
  - center-titles
---
Tags: #terraform

# Data Sources

- Allow TF to use information defined outside of TF, Defined by another separate TF configuration, or modified by function

### Using Data Sources

- Accessed via a special kind of resource known as a `data` resource

```yaml
data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}
```

