# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## 1.2.1

- Updated the IAM CodeBuild role to include KMS permissions

## 1.2.0

- Refactored to include a one-time bootstrap stage and a pipeline stage which will be run every time the pipelines need to be updated.
- The pipelines stage now uses an S3 bucket to hold the tfstate, and a dynamoDB lock table to prevent collisions.

## 1.1.0

### Added

- Pipelines for homepage repository

## 1.0.1

### Updated

- Restricted build hooks to only trigger for PRs or merges made by me personally

## 1.0.0

### Added

- Initial build
