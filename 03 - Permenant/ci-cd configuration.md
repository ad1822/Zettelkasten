---
cssclasses:
  - center-images
  - center-titles
---
Tags: #ci-cd

# GitLab CI/CD Pipeline Configuration

GitLab CI/CD pipelines are configured using a `.gitlab-ci.yml` file. The configuration includes global keywords, header keywords, and job-specific keywords.

---

## **Global Keywords**
Global keywords configure the overall behavior of the pipeline.

| **Keyword** | **Description**                                                                 |
|-------------|---------------------------------------------------------------------------------|
| `default`   | Custom default values for job keywords.                                        |
| `include`   | Import configuration from other YAML files.                                    |
| `stages`    | Define the names and order of the pipeline stages.                             |
| `workflow`  | Control what types of pipeline run.                                            |

---

## **Header Keywords**
Header keywords are used to define additional configurations.

| **Keyword** | **Description**                                                                 |
|-------------|---------------------------------------------------------------------------------|
| `spec`      | Define specifications for external configuration files.                        |

---

## **Job Keywords**
Jobs are configured with the following keywords:

| **Keyword**     | **Description**                                                        |
| --------------- | ---------------------------------------------------------------------- |
| `after_script`  | Override a set of commands that are executed after the job.            |
| `allow_failure` | Allow the job to fail without causing the pipeline to fail.            |
| `artifacts`     | Specify a list of files and directories to attach to a job on success. |
| `before_script` | Override a set of commands that are executed before the job.           |
| `cache`         | Specify a list of files that should be cached between subsequent runs. |
| `coverage`      | Define code coverage settings for a given job.                         |
| `dependencies`        | Restrict which artifacts are passed to a specific job by providing a list of jobs to fetch from. |
| `environment`         | Name of an environment to which the job deploys.                                                |
| `extends`             | Configuration entries that this job inherits from.                                              |
| `identity`            | Authenticate with third-party services using identity federation.                               |
| `image`               | Use Docker images.                                                                              |
| `inherit`             | Select which global defaults all jobs inherit.                                                  |
| `interruptible`       | Defines if a job can be canceled when made redundant by a newer run.                             |
| `manual_confirmation` | Define a custom confirmation message for a manual job.                                           |
| `needs`               | Execute jobs earlier than the stage ordering.                                                   |
| `pages`               | Upload the result of a job to use with GitLab Pages.                                             |
| `parallel`            | Define how many instances of a job should run in parallel.                                       |
| `release`             | Instruct the runner to generate a release object.                                               |
| `resource_group`      | Limit job concurrency.                                                                           |
| `retry`               | Define when and how many times a job can be auto-retried in case of failure.                     |
| `rules`               | List conditions to evaluate and determine job attributes, including whether it’s created.        |
| `script`              | Shell script that is executed by a runner.                                                      |
| `run`                 | Run configuration executed by a runner.                                                         |
| `secrets`             | Specify the CI/CD secrets the job needs.                                                        |
| `services`            | Use Docker service images.                                                                      |
| `stage`               | Define the stage for the job.                                                                   |
| `tags`                | List of tags used to select a runner.                                                           |
| `timeout`             | Define a custom job-level timeout, overriding project-wide settings.                            |
| `trigger`             | Define a downstream pipeline trigger.                                                           |
| `when`                | Specify when to run the job.                                                                    |

---

## **CI/CD Variables**
CI/CD variables allow you to define dynamic values for jobs.

| **Keyword**           | **Description**                                              |
| --------------------- | ------------------------------------------------------------ |
| **Default Variables** | Define default CI/CD variables for all jobs in the pipeline. |
| **Job Variables**     | Define CI/CD variables specific to individual jobs.          |
