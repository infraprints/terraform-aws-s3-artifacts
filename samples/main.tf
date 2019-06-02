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

