---
cssclasses:
  - center-images
  - center-titles
---
Tags: #ci-cd

# MergeReq

- [`rules`](https://docs.gitlab.com/ee/ci/yaml/index.html#rules): Add rules to each job to configure in which pipelines they run. You can configure jobs to run in [merge request pipelines](https://docs.gitlab.com/ee/ci/pipelines/merge_request_pipelines.html), [scheduled pipelines](https://docs.gitlab.com/ee/ci/pipelines/schedules.html), or other specific situations. Rules are evaluated from top to bottom, and if a rule matches, the job is added to the pipeline.
- [CI/CD variables](https://docs.gitlab.com/ee/ci/variables/index.html): use these environment variables to configure job behavior in the configuration file and in script commands. [Predefined CI/CD variables](https://docs.gitlab.com/ee/ci/variables/predefined_variables.html) are variables that you do not need to manually define. They are automatically injected into pipelines so you can use them to configure your pipeline. Variables are usually formatted as `$VARIABLE_NAME`. and predefined variables are usually prefixed with `$CI_`
```yaml
rules:
    - if: $CI_PIPELINE_SOURCE == 'merge_request_event'
    - # Run for all changes to a merge request's source branch
    - if: $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH    
```
