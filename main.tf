locals {
  tags = {
    TieredStorage = "enabled"
    AutoExpire    = "true"
    ExpiresIn     = var.expiration_days
  }
}

resource "aws_s3_bucket" "default" {
  bucket        = var.bucket
  acl           = "private"
  force_destroy = false

  tags = merge(local.tags, var.tags)

  lifecycle_rule {
    id      = "tiered"
    enabled = true

    tags = {
      Rule        = "tiered"
      AutoClean   = "true"
      Description = "Transitions the objects between storage classes, until eventual expiration."
    }

    transition {
      days          = var.standard_transition_days
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.glacier_transition_days
      storage_class = "GLACIER"
    }

    expiration {
      days = var.expiration_days
    }
  }
}

resource "aws_s3_bucket_policy" "default" {
  bucket = aws_s3_bucket.default.id
  policy = data.aws_iam_policy_document.default.json
}

data "aws_iam_policy_document" "default" {
  statement {
    sid       = "ForceSSLOnlyAccess"
    effect    = "Deny"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.default.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket                  = aws_s3_bucket.default.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
