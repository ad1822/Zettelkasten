---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Role-Based Access Control (RBAC) in Kubernetes

## Overview
Role-Based Access Control (RBAC) is a method of regulating access to resources based on the roles of individual users within an organization. In Kubernetes, RBAC is used to control access to the Kubernetes API, ensuring that users and services have the appropriate permissions to perform their tasks.

---

## Key Concepts

### Roles and ClusterRoles
- **Role**: Defines a set of permissions within a specific namespace.
- **ClusterRole**: Similar to a Role, but it is cluster-scoped and can be used across all namespaces.

### RoleBindings and ClusterRoleBindings
- **RoleBinding**: Grants the permissions defined in a Role or ClusterRole to a user or set of users within a specific namespace.
- **ClusterRoleBinding**: Grants the permissions defined in a ClusterRole to a user or set of users across the entire cluster.

### Subjects
- **Users**: Individual users who interact with the Kubernetes cluster.
- **Groups**: A collection of users.
- **ServiceAccounts**: Accounts used by pods to authenticate with the Kubernetes API.

---

## Creating Roles and ClusterRoles

### Example Role
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods"]
  verbs: ["get", "watch", "list"]```

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cluster-admin
rules:
- apiGroups: [""]
  resources: ["*"]
  verbs: ["*"]
```

## Creating RoleBindings and ClusterRoleBindings

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: read-pods
  namespace: default
subjects:
- kind: User
  name: jane
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io



apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: read-secrets-global
subjects:
- kind: Group
  name: manager
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io
```


## Common Verbs

- **get**: Retrieve a resource.
- **list**: List all resources of a type.
- **watch**: Watch for changes to a resource.
- **create**: Create a new resource.
- **update**: Update an existing resource.
- **patch**: Partially update a resource.
- **delete**: Delete a resource.

---

## Best Practices

1. **Least Privilege**: Grant only the permissions necessary for a user or service to perform its tasks.   
2. **Regular Audits**: Regularly review and audit RBAC policies to ensure they are up-to-date and secure.
3. **Use Namespaces**: Utilize namespaces to isolate resources and limit the scope of permissions.
4. **Service Accounts**: Use service accounts for pods that need to interact with the Kubernetes API.

---
