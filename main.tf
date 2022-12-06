resource "google_storage_bucket" "main" {
  for_each      = var.bucket_name
  name          = "${var.env}-${var.product_base_name}-${each.key}-${var.project_id}-bucket"
  location      = var.location
  storage_class = var.class
  force_destroy = var.delete_data
  versioning {
    enabled = var.versioning
  }
  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      condition {
        # with_state                 = lifecycle_rule.value.with_state
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
