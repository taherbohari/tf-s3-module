terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "/home/taher/.aws/credentials"
  profile                 = "friday"
}

module "s3-bucket" {
  source 		= "../modules/s3/"
  bucket 		= "${var.prefix}-hourly"
  request_payer 	= var.request_payer
  create_bucket 	= var.create_bucket
  acceleration_status 	= var.acceleration_status
  acl 			= var.acl
  tags 			= var.tags
  force_destroy 	= var.force_destroy
  versioning 		= var.versioning
  lifecycle_rule 	= var.lifecycle_rule
  logging 		= var.logging
  website 		= var.website

#  policy 		  = var.policy
  policy_file		  = var.policy_file
  attach_policy 	  = var.attach_policy
  attach_public_policy 	  = var.attach_public_policy
  block_public_acls 	  = var.block_public_acls
  block_public_policy 	  = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  attach_elb_log_delivery_policy 	= var.attach_elb_log_delivery_policy
  server_side_encryption_configuration  = var.server_side_encryption_configuration
}
