resource "aws_iam_policy" "terraform" {
  name        = "NetautoTerraformAccess"
  description = "Dictates which AWS resources Terraform will be able to access"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "iam:*",
            "rds:*",
            "apigateway:*",
            "s3:*",
            "kms:*",
            "logs:*",
            "resource-groups:*",
            "lambda:*",
            "ec2:*",
            "dynamodb:*",
            "s3-object-lambda:*",
            "acm:*",
            "ecs:*",
            "elasticloadbalancing:*",
            "secretsmanager:*",
            "ecr:*",
            "route53:*",
            "route53resolver:*",
            "ssm:StartSession",
            "eks:*"
          ]
          Effect   = "Allow"
          Resource = "*"
          Sid      = "VisualEditor0"
        },
      ]
      Version = "2012-10-17"
    }
  )
}

data "aws_iam_user" "terraform" {
  user_name = "netauto_terraform"
}

resource "aws_iam_policy_attachment" "terraform" {
  name       = "terraform_access"
  users      = [data.aws_iam_user.terraform.user_name]
  policy_arn = aws_iam_policy.terraform.arn
}
