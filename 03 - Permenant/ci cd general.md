---
cssclasses:
  - center-images
  - center-titles
---
Tags: #ci-cd

# General

- Jobs : These are self-contained parts of a pipeline that run your commands, Jobs runs on `runners`, separate from the Gitlab instance
- script : This section of a job’s configuration is where you define the commands for jobs. If there are multiple commands (in an array), they run in order. Each command executes as if it was run as a CLI command. By default, if a command fails or returns an error, the job is flagged as failed and no more commands run.
- image : This is just a docker image. Gitlab runners clone a docker image that is in configuration.
- [`artifacts`](https://docs.gitlab.com/ee/ci/yaml/index.html#artifacts): Jobs are self-contained and do not share resources with each other. If you want files generated in one job to be used in another job, you must save them as artifacts first. Then later jobs can retrieve the artifacts and use the generated files
- [`stage`](https://docs.gitlab.com/ee/ci/yaml/index.html#stage) and [`stages`](https://docs.gitlab.com/ee/ci/yaml/index.html#stage): The most common pipeline configurations group jobs into stages. Jobs in the same stage can run in parallel, while jobs in later stages wait for jobs in earlier stages to complete. If a job fails, the whole stage is considered failed and jobs in later stages do not start running
- [`allow_failure`](https://docs.gitlab.com/ee/ci/yaml/index.html#allow_failure): Jobs that fail intermittently, or are expected to fail, can slow down productivity or be difficult to troubleshoot. Use `allow_failure` to let jobs fail without halting pipeline execution.
- [`dependencies`](https://docs.gitlab.com/ee/ci/yaml/index.html#dependencies): Use `dependencies` to control artifact downloads in individual jobs by listing which jobs to fetch artifacts from.


### Reduce Duplicated Configuration
- Use `extends` and `defaults` to create single source 
- [Hidden jobs](https://docs.gitlab.com/ee/ci/jobs/index.html#hide-jobs): Jobs that start with `.` are never added to a pipeline. Use them to hold configuration you want to reuse.
- [`extends`](https://docs.gitlab.com/ee/ci/yaml/index.html#extends): Use extends to repeat configuration in multiple places, often from hidden jobs. If you update the hidden job’s configuration, all jobs extending the hidden job use the updated configuration.
- [`default`](https://docs.gitlab.com/ee/ci/yaml/index.html#default): Set keyword defaults that apply to all jobs when not defined.


