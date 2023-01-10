variable "bucket_name" {
  description = "Unique names for buckets"
  type        = set(string)
}

variable "project_id" {
  description = "ID of the project in which the resources should be created."
  type        = string
}

variable "product_base_name" {
  description = "Cloud resources base name (used to create services)"
  type        = string
}

variable "env" {
  description = "Variable to mark the environment of the resource (used to create services)."
  type        = string
}

variable "location" {
  description = "The geographic location where the bucket be located (for the main project)"
  type        = string
}

variable "class" {
  description = "The Storage Class of the bucket. Can be set one of STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  type        = string
  default     = "STANDARD"
}

variable "delete_data" {
  description = "If true, delete all data in the buckets when the resource is destroying"
  type        = bool
  default     = true
}

variable "versioning" {
  description = "Assign versioning for Storage"
  type        = bool
  default     = true
}

variable "lifecycle_rules" {
  description = "Assign lifecycle rule for Storage"
  type        = map(any)
  default     = {}
}

variable "labels" {
  description = "The labels associated with this bucket. You can use these to organize and group your datasets"
  type        = map(string)
  default     = {}
}
