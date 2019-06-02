locals {
  tags = {
    TieredStorage = "enabled"
    AutoExpire    = "true"
    ExpiresIn     = var.expiration_days
  }
}

resource "aws_s3_bucket" "artifacts" {
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

