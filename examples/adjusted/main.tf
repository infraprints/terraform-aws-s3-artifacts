provider "aws" {
  region = "us-east-1"
}

module "label" {
  source = "git::https://gitlab.com/infraprints/modules/terraform-terraform-unique-label"

  namespace  = "ACME"
  stage      = "proto"
  name       = "build"
  attributes = ["artifacts"]
}

module "example" {
  source = "../../"

  bucket                   = "${module.label.id}"
  standard_transition_days = 10
  glacier_transition_days  = 30
  expiration_days          = 365

  tags = {
    Longevity = "Yearly"
  }
}
