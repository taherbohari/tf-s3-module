output "id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.friday[0].id
}

output "arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = aws_s3_bucket.friday[0].arn
}

output "bucket_domain_name" {
  description = "The bucket domain name."
  value       = aws_s3_bucket.friday[0].bucket_domain_name
}

output "regional_domain_name" {
  description = "The bucket region-specific domain name."
  value       = aws_s3_bucket.friday[0].bucket_regional_domain_name
}

output "hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = aws_s3_bucket.friday[0].hosted_zone_id
}

output "region" {
  description = "The AWS region of this bucket."
  value       = aws_s3_bucket.friday[0].region
}

output "website_endpoint" {
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = aws_s3_bucket.friday[0].website_endpoint
}

output "website_domain" {
  description = "The domain of the website endpoint"
  value       = aws_s3_bucket.friday[0].website_domain
}
