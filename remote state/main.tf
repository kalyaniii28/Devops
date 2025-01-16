terraform {
  required_version = ">= 0.12"

  backend "s3" {
    encrypt = true
  }
}

# ------------------------------------------------------------------------------ 
# CONFIGURE OUR AWS CONNECTION 
# ------------------------------------------------------------------------------ 

provider "aws" {}

data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${local.account_id}-terraform-states"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }
}
