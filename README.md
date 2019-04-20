# AWS S3 Terraform State Output

Terraform module for an tiered storage S3 bucket with eventual object expiration. Primary use key is for a build artifacts storage.

These types of resources are supported:

- [S3 Bucket](https://www.terraform.io/docs/providers/aws/r/s3_bucket.html)

## Usage

```hcl
module "build_artifacts" {
  source = "git::https://gitlab.com/infraprints/modules/aws/s3-artifacts"

  bucket                   = "infraprints-s3-artifacts"
  standard_transition_days = 10
  glacier_transition_days  = 30
  expiration_days          = 365

  tags = {
    Longevity  = "Yearly"
    Expiration = "True"
  }
}
```

## Examples

- [Basic Example](examples/basic)
- [Adjusted Example](examples/adjusted)

## Notes

- With the default configuration, all objects in the S3 bucket will **expire** in 90 days.
- The S3 bucket uses tiered storage with eventual expiration. This bucket is not designed for long term persistence.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket | The name of the bucket. | string | n/a | yes |
| expiration\_days | Number of days until objects are expunged. | string | `"90"` | no |
| force\_destroy | A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | string | `"false"` | no |
| glacier\_transition\_days | Number of days until objects are transitioned to the GLACIER storage class. | string | `"60"` | no |
| region | If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee. | string | `""` | no |
| standard\_transition\_days | Number of days until objects are transitioned to the STANDARD_IA storage class. | string | `"30"` | no |
| tags | A mapping of tags to assign to the bucket. | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| bucket | The name of the bucket. |
| bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| id | The name of the bucket. |
| region | The AWS region this bucket resides in. |

