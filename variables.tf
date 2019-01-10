variable "bucket" {
  type        = "string"
  description = "The name of the bucket."
}

variable "force_destroy" {
  type        = "string"
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  default     = false
}

variable "region" {
  type        = "string"
  description = "If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee."
  default     = ""
}

variable "standard_transition_days" {
  type        = "string"
  description = "Number of days until objects are transitioned to the STANDARD_IA storage class."
  default     = 30
}

variable "glacier_transition_days" {
  type        = "string"
  description = "Number of days until objects are transitioned to the GLACIER storage class."
  default     = 60
}

variable "expiration_days" {
  type        = "string"
  description = "Number of days until objects are expunged."
  default     = 90
}

variable "tags" {
  type        = "map"
  description = "A mapping of tags to assign to the bucket."
  default     = {}
}
