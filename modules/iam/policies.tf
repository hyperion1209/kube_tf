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
            "ssm:*",
            "aps:*",
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

resource "aws_iam_policy" "terraform_assume_role" {
  name        = "NetautoTerraformAssumeRole"
  description = "Allows terraform user to assume Terraform role"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole",
          Effect   = "Allow"
          Resource = "${aws_iam_role.terraform.arn}"
        },
      ]
      Version = "2012-10-17"
    }
  )
}

data "aws_iam_user" "terraform" {
  user_name = "netauto_terraform"
}

resource "aws_iam_user_policy_attachment" "terraform_assume_role" {
  user       = data.aws_iam_user.terraform.user_name
  policy_arn = aws_iam_policy.terraform_assume_role.arn
}

resource "aws_iam_role" "terraform" {
  name = "netauto_terraform"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          "AWS" = "${data.aws_iam_user.terraform.arn}"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "terraform" {
  role       = aws_iam_role.terraform.name
  policy_arn = aws_iam_policy.terraform.arn
}
