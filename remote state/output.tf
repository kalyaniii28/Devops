output "s3_bucket_name" {
  value       = aws_s3_bucket.terraform_state.id
  description = "The NAME of the S3 bucket"
}

output "s3_name_arn"{
  value =aws_s3_arn.terraform_state.arn
  description = "The ARN of the S3 bucket"
}

output "s3_name_region"{
  value =aws_s3_riegon.terraform_state.arn
  description = "The region of the S3 bucket"
}

output "dynamodb_table_name"{
  value =dynamodb_table_name.terraform_lock.name
  description = "The name of the tablt"
}

output "dynamodb_table_arn"{
  value =dynamodb_table_arn.terraform_lock.arn
  description = "The arn of the tablt"
}

