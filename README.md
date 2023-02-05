# Pipelines

[![Last-Commit](https://img.shields.io/github/last-commit/Oliver-Bilbie/pipelines)](https://github.com/Oliver-Bilbie/pipelines/blob/main/CHANGELOG.md)

---

## Overview

Terraform for building CI/CD Pipelines for other repositories.
New pipelines can be created by adding an entry to [locals.tf](https://github.com/Oliver-Bilbie/pipelines/blob/main/terraform/locals.tf) and deploying the Terraform as outlined below.

---

## Deploying

This project contains a makefile for ease of use.

### Initialize

After making changes, run

```
make init
```

from the root directory to initialize and validate the Terraform.

### Plan

To generate a plan of the changes made, run

```
make plan
```

from the root directory.

### Apply

To build the initialized infrastructure, run

```
make apply
```

from the root directory.

### Destroy

To remove the deployed infrastructure, run

```
make destroy
```

from the root directory.
