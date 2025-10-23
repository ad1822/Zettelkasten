---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

#### Don't use "Naked" Pods .
- Don't use naked Pods (that is, Pods not bound to a [ReplicaSet](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/) or [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)) if you can avoid it. Naked Pods will not be rescheduled in the event of a node failure.
- A Deployment, which both creates a ReplicaSet to ensure that the desired number of Pods is always available, and specifies a strategy to replace Pods (such as [RollingUpdate](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#rolling-update-deployment)), is almost always preferable to creating Pods directly, except for some explicit [`restartPolicy: Never`](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy) scenarios. A [Job](https://kubernetes.io/docs/concepts/workloads/controllers/job/) may also be appropriate.
