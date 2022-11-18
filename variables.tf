variable "bucket_name" {
  description = "A unique IDs for buckets"
  type        = set(string)
  default     = []
}

variable "project_id" {
  description = "The ID of the project to which the resource belongs"
  type        = string
}

variable "product_base_name" {
  description = "Cloud resources base name (used to create services)"
  type        = string
}

variable "env" {
  description = "Variable to mark the environment of the resource (used to create services)."
  type        = string
  default     = "dev"
}

variable "location" {
  description = "The geographic location where the bucket is located (for the main project)"
  type        = string
}

variable "storage_class" {
  description = "The Storage Class of the bucket"
  type        = string
  default     = "STANDARD"
}

variable "delete_data" {
  description = "If set to true, delete all data in the buckets when the resource is destroying"
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
  default = {
    lifecycle_rule_01 = {
      with_state                 = ""
      num_newer_versions         = 2
      days_since_noncurrent_time = null
      storage_class              = ""
      type                       = "Delete"
    }
    lifecycle_rule_02 = {
      with_state                 = ""
      num_newer_versions         = null
      days_since_noncurrent_time = 7
      storage_class              = ""
      type                       = "Delete"
    }
  }
}
