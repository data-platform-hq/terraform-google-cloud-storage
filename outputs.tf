output "bucket" {
  value       = { for bucket in var.bucket_name : bucket => google_storage_bucket.main[bucket].url }
  description = "The base URL of the bucket."
}
