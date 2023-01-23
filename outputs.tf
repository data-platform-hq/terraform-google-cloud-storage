output "bucket_url" {
  value       = { for k in var.bucket_name : k => google_storage_bucket.main[k].url }
  description = "The base URL of the storage bucket."
}
output "bucket_name" {
  value       = { for k in var.bucket_name : k => trimprefix(google_storage_bucket.main[k].name, "gs://") }
  description = "The storage bucket name."
}
