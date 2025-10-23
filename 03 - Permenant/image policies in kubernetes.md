---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Image

- By default `ImagePullPolicy` is set to Always

#### List of Policies
1. IfNotPresent
2. Always
3. Never

### Default Image pull policy
- If you omit the field, Set to policy is `IfNotPresent`
- If image name is set to `:latest`, `Always`
- Don't specify the tag for container image, `Always`
- Isn't `:latest`, `IfNotPresent`
