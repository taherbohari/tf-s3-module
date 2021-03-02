bucket = "terraform-test-hourly"
acl           = "private"
force_destroy = true
attach_policy = true
policy        = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::terraform-test-hourly",
      "Principal": "*"
    }
  ]
}
POLICY

tags = {
  Owner = "Taher"
}

versioning = {
  enabled = true
}

website = {
  index_document = "index.html"
  error_document = "error.html"
}

logging = {
  target_bucket = "tf-hourly-log-bucket"
  target_prefix = "log/"
}

lifecycle_rule = [
  {
    id      = "myrule"
    enabled = true
    prefix  = "hourly/"
    abort_incomplete_multipart_upload_days = 7
    transition = [
      { days          = 30
        storage_class = "ONEZONE_IA"
      }, 
      { days          = 60
        storage_class = "GLACIER"
      }
    ]
    expiration = { days = 90 }
    noncurrent_version_expiration = {  days = 90 }
    noncurrent_version_transition = [
      {
        days          = 30
        storage_class = "GLACIER"
      }
    ]
  }
]

server_side_encryption_configuration = {
  rule = {
    apply_server_side_encryption_by_default = {
      sse_algorithm     = "aws:kms"
    }
  }
}

# S3 bucket-level Public Access Block configuration
block_public_acls       = true
block_public_policy     = true
ignore_public_acls      = true
restrict_public_buckets = true
