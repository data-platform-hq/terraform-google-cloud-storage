output "bucket_url" {
  value       = google_storage_bucket.this.url
  description = "The base URL of the storage bucket."
}
output "bucket_name" {
  value       = google_storage_bucket.this.name
  description = "The storage bucket name."
}
