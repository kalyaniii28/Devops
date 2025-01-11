terraform {
  required_version = ">= 0.12"
}

provider "aws" {}

data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id  # Correct attribute name `account_id`
}

resource "aws_s3_bucket" "example" {
  bucket = "${local.account_id}-terraform-state"  # Corrected the typo in 'bucket'

  versioning {
    enabled = true  # 'enabled' is the correct attribute, not 'enable'
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {  # Added missing resource name
  #bucket = aws_s3_bucket.example.id  # Linking to the created bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_lock" {  # Corrected resource name from "terrafor-lock" to "terraform_lock"
  name             = "terraform-lock"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}
