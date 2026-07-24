/*
|--------------------------------------------------------------------------
| SalmanStack Cloud Platform (SSCP)
|--------------------------------------------------------------------------
|
| File        : outputs.tf
| Component   : Terraform Backend Bootstrap
| Description : Exposes information about the Terraform state bucket for
|               downstream configurations and operational verification.
|
|--------------------------------------------------------------------------
*/

# =============================================================================
# Terraform State Bucket Outputs
# =============================================================================

output "terraform_state_bucket_name" {
  description = "Name of the Terraform state bucket."

  value = google_storage_bucket.terraform_state.name
}

output "terraform_state_bucket_id" {
  description = "Unique identifier of the Terraform state bucket."

  value = google_storage_bucket.terraform_state.id
}

output "terraform_state_bucket_url" {
  description = "Google Cloud Storage URL of the Terraform state bucket."

  value = google_storage_bucket.terraform_state.url
}

output "terraform_state_bucket_self_link" {
  description = "Self link of the Terraform state bucket."

  value = google_storage_bucket.terraform_state.self_link
}
