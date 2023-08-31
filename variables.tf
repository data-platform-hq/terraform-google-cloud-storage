variable "bucket_config" {
  description = "Contains Storage buckets name, roles, listst of entities (users, groups, service accounts)"
  type = object({
    name    = string
    readers = optional(list(string))
    writers = optional(list(string))
    owners  = optional(list(string))
  })
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = ""
}

variable "suffix" {
  description = "Resource name suffix"
  type        = string
  default     = ""
}

variable "project_id" {
  description = "ID of the project in which the resources should be created."
  type        = string
  default     = ""
}

variable "env" {
  description = "Variable to mark the environment of the resource (used to create services)."
  type        = string
}

variable "location" {
  description = "The geographic location where the bucket be located (for the main project)."
  type        = string
}

variable "class" {
  description = "The Storage Class of the bucket. Can be set one of STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  type        = string
  default     = "STANDARD"
}

variable "delete_data" {
  description = "If true, delete all data in the buckets when the resource is destroying."
  type        = bool
  default     = true
}

variable "versioning" {
  description = "Assign versioning for Storage."
  type        = bool
  default     = true
}

variable "lifecycle_rules" {
  description = "Assign lifecycle rule for Storage."
  type = map(object({
    with_state                 = optional(string),
    num_newer_versions         = optional(number),
    days_since_noncurrent_time = optional(number),
    type                       = optional(string),
    storage_class              = optional(string)
  }))
  default = {}
}

variable "labels" {
  description = "The labels associated with this bucket. You can use these to organize and group your datasets."
  type        = map(string)
  default     = {}
}
