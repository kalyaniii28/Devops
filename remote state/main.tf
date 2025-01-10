terraform {
required_version = ">= 0.12"
}

provider "aws"{}

data "aws_caller_identity" "current" {}

local{
account_id = data.aws_caller_identity.current.accountid #mention account id on details
}

resource "aws_s3_bucket" "example"{
backet = "${local.account_id)-terraform-state"
 version


