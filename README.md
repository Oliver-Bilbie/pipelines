# Pipelines

[![Last-Commit](https://img.shields.io/github/last-commit/Oliver-Bilbie/pipelines)](https://github.com/Oliver-Bilbie/pipelines/blob/main/CHANGELOG.md)

---

## Overview

Terraform for building CI/CD Pipelines for other repositories.
New pipelines can be created by adding an entry to [locals.tf](https://github.com/Oliver-Bilbie/pipelines/blob/main/terraform/locals.tf) and deploying the Terraform as outlined below.

---

## Deploying

### Stages

The Terraform in this repository is deployed in two stages.

- The _bootstrap_ stage only needs to be run once. This stage creates the following infrastructure which is required to deploy the _pipelines_ stage:

  - An S3 bucket to store the Terraform state
  - A DynamoDB table to handle Terraform state locking
  - A KMS key to encrypt the S3 bucket and DynamoDB table

- The _pipelines_ stage is used to create or update the pipeline configuration for various repositories. It creates:
  - Three CodeBuild projects for each repository:
    - One to run unit tests when a PR is created or updated
    - One to build and deploy to the development environment when a PR is created or updated
    - One to build and deploy to the production environment when a PR is merged into the main branch
  - Webhooks corresponding to the CodeBuild projects outlined above
  - An IAM role to be assumed by the CodeBuild projects

### Initialize

This project contains a _Makefile_ for ease of use.
To initialize the _bootstrap_ stage, run

```
make init-bootstrap
```

from the root directory to initialize and validate the Terraform.

Similarly, to initialize the _pipelines_ stage, run

```
make init-pipelines
```

For the remainder of this documentation, I will use **STAGE** to represent either _bootstrap_ or _pipelines_. Please substitute this value as required.

### Plan

To generate a plan of the changes made, run

```
make plan-STAGE
```

from the root directory.

### Apply

To build the initialized infrastructure, run

```
make apply-STAGE
```

from the root directory.

### Destroy

To remove the deployed infrastructure, run

```
make destroy-STAGE
```

from the root directory.
