resource "aws_codebuild_project" "build-dev" {
  for_each = { for k, v in local.repositories : k => v }

  name         = "${each.key}-build-dev"
  service_role = aws_iam_role.pipeline-role.arn

  cache {
    type  = "LOCAL"
    modes = ["LOCAL_CUSTOM_CACHE"]
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "BUILD_ENV"
      value = "development"
    }

    environment_variable {
      name  = "STAGE"
      value = "dev"
    }
  }

  source {
    type            = "GITHUB"
    location        = each.value.http_clone_url
    git_clone_depth = 1
    buildspec       = "pipelines/buildspec.ci.yaml"
  }

  source_version = "refs/pull/1/head"

  artifacts {
    type = "NO_ARTIFACTS"
  }
}


resource "aws_codebuild_webhook" "pr-build" {
  for_each = { for k, v in aws_codebuild_project.build-dev : k => v }

  project_name = aws_codebuild_project.build-dev[each.key].name
  build_type   = "BUILD"

  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PULL_REQUEST_CREATED,PULL_REQUEST_UPDATED"
    }
    filter {
      type    = "ACTOR_ACCOUNT_ID"
      pattern = data.aws_ssm_parameter.github_id.value
    }
  }
}
