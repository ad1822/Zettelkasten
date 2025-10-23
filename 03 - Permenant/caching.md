---
cssclasses:
  - center-images
  - center-titles
---
Tags: #ci-cd

# Caching

- A cache is one or more files a job downloads and saves.
- Subsequent jobs that use the same cache don't have to download the files again, So they execute more quickly.

### How cache is different from artifacts ? 
- Use cache for dependencies, like packages you download from the internet. Cache is stored where Gitlab Runner is installed and uploaded to S3 if distributed cache is enabled.

### Cache
- Define cache per job by using the `cache` keyword. Otherwise it is disabled.
- Subsequent pipelines can use the cache.
- Subsequent jobs in the same pipeline can use the cache, if the dependencies are identical
- Different projects cannot share the cache.
- By default, protected and non-protected branches [do not share the cache](https://docs.gitlab.com/ee/ci/caching/#cache-key-names).

### Artifacts
- Define artifacts per job .
- Subsequent jobs in later stages of the same pipeline can use artifacts.
- Artifacts expire after 30 days   by default.
- The latest artifacts do not expire if [keep latest artifacts](https://docs.gitlab.com/ee/ci/jobs/job_artifacts.html#keep-artifacts-from-most-recent-successful-jobs) is enabled.
- Use [dependencies](https://docs.gitlab.com/ee/ci/yaml/index.html#dependencies) to control which jobs fetch the artifacts.

### Good Practice for Caching
- [Tag your runners](https://docs.gitlab.com/ee/ci/runners/configure_runners.html#control-jobs-that-a-runner-can-run) and use the tag on jobs that share the cache.
- [Use runners that are only available to a particular project](https://docs.gitlab.com/ee/ci/runners/runners_scope.html#prevent-a-project-runner-from-being-enabled-for-other-projects).
- [Use a `key`](https://docs.gitlab.com/ee/ci/yaml/index.html#cachekey) that fits your workflow. For example, you can configure a different cache for each branch.
