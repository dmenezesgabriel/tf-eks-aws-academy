terraform {

  required_version = "~> 1.0"

  # --- At first terraform init must comment this block
  backend "s3" {
    bucket         = "postech-challenge-3-293351734410"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "alias/postech-challenge-3-293351734410-backend-bucket"
    dynamodb_table = "postech-challenge-3-293351734410"
  }
  # --- At first terraform init must comment this block
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

locals {
  bucket_name         = "${var.project_name}-${data.aws_caller_identity.current.account_id}"
  dynamodb_table_name = "${var.project_name}-${data.aws_caller_identity.current.account_id}"
}

resource "aws_kms_key" "terraform_bucket_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_kms_alias" "key_alias" {
  name          = "alias/${var.project_name}-${data.aws_caller_identity.current.account_id}-backend-bucket"
  target_key_id = aws_kms_key.terraform_bucket_key.key_id
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = local.bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.terraform_bucket_key.arn
    }
  }
}

resource "aws_dynamodb_table" "terraform_state" {
  name           = local.dynamodb_table_name
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
