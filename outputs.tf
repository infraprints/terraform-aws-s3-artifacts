output "bucket" {
  description = "The name of the bucket."
  value       = "${var.bucket}"
}

output "id" {
  description = "The name of the bucket."
  value       = "${aws_s3_bucket.artifacts.id}"
}

output "arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = "${aws_s3_bucket.artifacts.arn}"
}

output "bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = "${aws_s3_bucket.artifacts.bucket_domain_name}"
}

output "region" {
  description = "The AWS region this bucket resides in."
  value       = "${aws_s3_bucket.artifacts.region}"
}
