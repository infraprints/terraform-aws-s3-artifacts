module "label" {
  source = "git::https://gitlab.com/infraprints/modules/terraform-terraform-unique-label"

  namespace  = "Infraprints"
  stage      = "proto"
  name       = "build"
  attributes = ["artifacts"]
}

module "example" {
  source = "../../"

  bucket                   = module.label.id
  standard_transition_days = 30
  glacier_transition_days  = 60
  expiration_days          = 365

  tags = {
    Longevity = "Yearly"
  }
}

