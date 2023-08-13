variable "project" {
  type        = string
  description = "Project name"
}

variable "region" {
  type        = string
  description = "AWS region to deploy infrastructure in"
}

variable "github_id_ssm" {
  type        = string
  description = "SSM parameter name containing the GitHub ID of the user with permission to trigger the pipelines"
}
