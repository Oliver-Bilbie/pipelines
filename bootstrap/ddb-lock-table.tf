resource "aws_dynamodb_table" "tf_lock_table" {
  name         = "${var.project}-tf-lock-table"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled     = "true"
    kms_key_arn = aws_kms_key.key.arn
  }
}
