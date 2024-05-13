output "backend_state_bucket" {
  value = aws_s3_bucket.terraform_state.bucket
}

output "backend_state_dynamo_lock_table" {
  value = aws_dynamodb_table.terraform_state.name
}
