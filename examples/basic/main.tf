module "example" {
  source = "../../"

  bucket = "acme-artifacts-${random_id.unique.hex}"
}

resource "random_id" "unique" {
  byte_length = 4
}
