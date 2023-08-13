resource "aws_kms_key" "key" {
  description         = "Key for encrypting the Terraform lock table and state bucket"
  enable_key_rotation = true
}
