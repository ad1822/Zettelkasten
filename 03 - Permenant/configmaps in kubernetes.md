---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# ConfigMaps

- A `ConfigMaps` is an API object used to store non-confidential data in key-value pairs. Pods can consume ConfigMaps as env variables, command-line arguments, or as configuration files in a volume.
- A ConfigMap allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable.
- The `data` field is designed to contain UTF-8 strings while the `binaryData` field is designed to contain binary data as base64-encoded strings.
- The name of a `ConfigMap` must be a valid [DNS subdomain name](https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#dns-subdomain-names).
- You can write a Pod `spec` that refers to a ConfigMap and configures the container(s) in that Pod based on the data in the ConfigMap. The Pod and the ConfigMap must be in the same [namespace](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces).
 
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: game-demo
data:
  # property-like keys; each key maps to a simple value
  player_initial_lives: "3"
  ui_properties_file_name: "user-interface.properties"

  # file-like keys
  game.properties: |
    enemy.types=aliens,monsters
    player.maximum-lives=5    
  user-interface.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true   
```
