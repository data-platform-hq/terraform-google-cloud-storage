output "raw_bucket" {
  value       = google_storage_bucket.main["raw"].url
  description = "raw storage bucket url"
}
output "temp_bucket" {
  value       = google_storage_bucket.main["temp"].url
  description = "temp storage bucket url"
}
output "artifacts_bucket" {
  value       = google_storage_bucket.main["artifacts"].url
  description = "artifacts storage bucket url"
}
