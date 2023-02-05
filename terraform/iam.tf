resource "aws_iam_role" "pipeline-role" {
  name = "pipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      },
    ]
  })
  
  inline_policy {
    name = "deploy_lambda"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action = [
            "iam:*",
            "codebuild:*",
            "cloudfront:*",
            "s3:*",
            "apigateway:*",
            "logs:*",
            "lambda:*",
            "dynamodb:*",
            "cloudformation:*",
            "events:*"
          ]
          Resource = "*"
        },
      ]
    })
  }

}
