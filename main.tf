terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.2.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

variable "SECRET_KEY_BASE" {
  type      = string
  sensitive = true
}

variable "FLISOLFLICTS_GMAIL_PASSWORD" {
  type      = string
  sensitive = true
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lamb_role" {
  name               = "lamb_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  inline_policy {
    name = "logs_permissions"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ]
          Effect   = "Allow"
          Resource = "*"
        }
      ]
    })
  }
}

resource "aws_lambda_function" "lamb" {
  function_name = "lamb"
  filename      = "lamb.zip"
  handler       = "config/environment.ActiveJob::LambHandler.handle"
  runtime       = "ruby3.2"
  role          = aws_iam_role.lamb_role.arn
  timeout       = 60

  environment {
    variables = {
      SECRET_KEY_BASE             = var.SECRET_KEY_BASE
      FLISOLFLICTS_GMAIL_PASSWORD = var.FLISOLFLICTS_GMAIL_PASSWORD
    }
  }
}
