locals {

  prefix = length(var.prefix) == 0 ? "" : "${var.prefix}-"
  env    = length(var.env) == 0 ? "" : "${var.env}-"
  suffix = length(var.suffix) == 0 ? "" : "-${var.suffix}"

  storage_bucket_name = replace("${local.prefix}${local.env}${var.bucket_config.name}${local.suffix}", "_", "-")

  bucket_readers = [for entity in flatten(var.bucket_config[*].readers) : {
    entity = entity
    role   = "READER"
  }]

  bucket_writers = [for entity in flatten(var.bucket_config[*].writers) : {
    entity = entity
    role   = "WRITER"
  }]

  bucket_owners = [for entity in flatten(var.bucket_config[*].owners) : {
    entity = entity
    role   = "OWNER"
  }]

  acls_mapping = tomap({
    for acl in concat(local.bucket_readers, local.bucket_writers, local.bucket_owners) :
    "${acl.role}:${acl.entity}" => acl if acl.entity != null
  })

}

resource "google_storage_bucket" "this" {
  name          = local.storage_bucket_name
  location      = var.location
  storage_class = var.class
  force_destroy = var.delete_data
  project = var.project_id
  versioning {
    enabled = var.versioning
  }
  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      condition {
        with_state                 = lookup(lifecycle_rule.value, "with_state", "")
        num_newer_versions         = lookup(lifecycle_rule.value, "num_newer_versions", "")
        days_since_noncurrent_time = lookup(lifecycle_rule.value, "days_since_noncurrent_time", "")
      }
      action {
        type          = lookup(lifecycle_rule.value, "type", "")
        storage_class = lookup(lifecycle_rule.value, "storage_class", "")
      }
    }
  }
  labels = var.labels
}

resource "google_storage_bucket_access_control" "this" {
  for_each = local.acls_mapping
  bucket   = google_storage_bucket.this.name
  role     = each.value.role
  entity   = each.value.entity
}
