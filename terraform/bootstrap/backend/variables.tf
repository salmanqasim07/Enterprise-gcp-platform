# -----------------------------------------------------------------------------
# Terraform State Bucket Configuration
# -----------------------------------------------------------------------------

variable "terraform_state_bucket_name" {
  description = "Globally unique name of the Terraform state bucket."
  type        = string
  nullable    = false

  validation {
    condition     = length(trimspace(var.terraform_state_bucket_name)) >= 3
    error_message = "The Terraform state bucket name must contain at least 3 characters."
  }
}

variable "terraform_state_bucket_location" {
  description = "Location where the Terraform state bucket will be created."
  type        = string
  default     = "US"
}

variable "terraform_state_bucket_storage_class" {
  description = "Storage class of the Terraform state bucket."
  type        = string
  default     = "STANDARD"

  validation {
    condition = contains(
      [
        "STANDARD",
        "NEARLINE",
        "COLDLINE",
        "ARCHIVE"
      ],
      upper(var.terraform_state_bucket_storage_class)
    )

    error_message = "Storage class must be STANDARD, NEARLINE, COLDLINE, or ARCHIVE."
  }
}


# -----------------------------------------------------------------------------
# Terraform State Version Retention
# -----------------------------------------------------------------------------

variable "terraform_state_bucket_version_retention" {
  description = "Maximum number of previous Terraform state object versions to retain."

  type = number

  default = 20

  validation {
    condition     = var.terraform_state_bucket_version_retention > 0
    error_message = "Version retention must be greater than zero."
  }
}



# =============================================================================
# Google Cloud Project Configuration
# =============================================================================

variable "project_id" {
  description = "Google Cloud Project ID where the bootstrap resources will be deployed."
  type        = string
  nullable    = false

  validation {
    condition     = length(trimspace(var.project_id)) > 0
    error_message = "The project_id variable cannot be empty."
  }
}

# =============================================================================
# Google Cloud Region Configuration
# =============================================================================

variable "region" {
  description = "Default Google Cloud region for provider configuration."
  type        = string
  default     = "us-central1"
}

# =============================================================================
# Google Cloud Zone Configuration
# =============================================================================

variable "zone" {
  description = "Default Google Cloud zone for provider configuration."
  type        = string
  default     = "us-central1-a"
}
