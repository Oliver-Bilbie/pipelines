data "aws_ssm_parameter" "github_id" {
  name = var.github_id_ssm
}
