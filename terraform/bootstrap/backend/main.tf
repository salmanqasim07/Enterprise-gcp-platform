/*
|--------------------------------------------------------------------------
| SalmanStack Cloud Platform (SSCP)
|--------------------------------------------------------------------------
|
| File        : main.tf
| Component   : Terraform Backend Bootstrap
| Description : Creates the Google Cloud Storage bucket used as the
|               remote backend for Terraform state.
|
| Design Decisions
| ----------------
| - Single centralized state bucket
| - Versioning enabled for state recovery
| - Public access blocked
| - Uniform Bucket-Level Access enabled
| - Bucket protected from accidental destruction
|
|--------------------------------------------------------------------------
*/

# =============================================================================
# Terraform Remote State Bucket
# =============================================================================

resource "google_storage_bucket" "terraform_state" {

  # ---------------------------------------------------------------------------
  # Resource Identification
  # ---------------------------------------------------------------------------

  name     = var.terraform_state_bucket_name
  project  = var.project_id
  location = var.terraform_state_bucket_location

  # ---------------------------------------------------------------------------
  # Storage Configuration
  # ---------------------------------------------------------------------------

  storage_class = var.terraform_state_bucket_storage_class

  # ---------------------------------------------------------------------------
  # Security Configuration
  # ---------------------------------------------------------------------------

  # Disable object ACLs and manage access using IAM only.
  uniform_bucket_level_access = true

  # Prevent the bucket from ever becoming publicly accessible.
  public_access_prevention = "enforced"

  # Never allow Terraform to delete a non-empty state bucket.
  force_destroy = false

  # ---------------------------------------------------------------------------
  # Versioning
  # ---------------------------------------------------------------------------

  # Keep previous versions of the Terraform state file.
  versioning {
    enabled = true
  }

  # ---------------------------------------------------------------------------
  # Lifecycle Rule
  # ---------------------------------------------------------------------------

  # Delete older object versions after the configured retention limit.
  lifecycle_rule {

    action {
      type = "Delete"
    }

    condition {
      num_newer_versions = var.terraform_state_bucket_version_retention
    }
  }

  # ---------------------------------------------------------------------------
  # Resource Labels
  # ---------------------------------------------------------------------------

  labels = merge(
    local.common_labels,
    {
      resource = "terraform-state-bucket"
    }
  )

  # ---------------------------------------------------------------------------
  # Resource Protection
  # ---------------------------------------------------------------------------

  lifecycle {
    prevent_destroy = true
  }
}
