module "label" {
  source = "git::https://gitlab.com/infraprints/modules/terraform-terraform-unique-label"

  namespace  = "ACME"
  stage      = "proto"
  name       = "build"
  attributes = ["artifacts"]
}

module "example" {
  source = "../../"

  bucket = "${module.label.id}"
}
