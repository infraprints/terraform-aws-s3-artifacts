# Standard Sample

Configuration in this directory creates a tiered S3 bucket, using the GitLab project as the source.

## Usage

To run this example you need to execute:

```bash
terraform init
terraform plan
terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

## Notes

- The module pulls from the GitLab project.
- The artifacts will expire within a year.
