# Basic Usage

Configuration in this directory creates an S3 bucket for storing build artifacts that will eventually expire.

## Usage

To run this example you need to execute:

```bash
terraform init
terraform plan
terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

## Notes

* This bucket will **delete** resources after the expiration period has past.
* The objects stored in this bucket will expire after the default duration set by `expiration_days`.
* The objects will automatically move between storage tiers based on the set periods (`standard_transition_days`, `glacier_transition_days`, `expiration_days`).