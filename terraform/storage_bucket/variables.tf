#/*
#|--------------------------------------------------------------------------
#| SalmanStack Cloud Platform (SSCP)
#|--------------------------------------------------------------------------
#|
#| Module: Storage Bucket
#|
#| Input variables consumed by the Storage Bucket module.
#|
#| These variables are intentionally generic so that the module can be
#| reused for Terraform state, backups, application storage,
#| log archives, and future platform services.
#|
#|--------------------------------------------------------------------------
#*/

# ==========================================================================
# Project Configuration
# ==========================================================================

variable "project_id" {
  description = "Google Cloud project ID where the bucket will be created."

  type = string

  nullable = false

  validation {
    condition     = length(trim(var.project_id, " ")) > 0
    error_message = "project_id cannot be empty."
  }
}

# ==========================================================================
# Bucket Configuration
# ==========================================================================

variable "name" {
  description = "Globally unique Cloud Storage bucket name."

  type = string

  nullable = false

  validation {
    condition     = length(trim(var.name, " ")) >= 3
    error_message = "Bucket name must contain at least 3 characters."
  }
}

variable "location" {
  description = "Bucket location (for example: US, EU, us-central1)."

  type = string

  default = "US"
}

variable "storage_class" {
  description = "Cloud Storage class."

  type = string

  default = "STANDARD"

  validation {
    condition = contains(
      [
        "STANDARD",
        "NEARLINE",
        "COLDLINE",
        "ARCHIVE"
      ],
      upper(var.storage_class)
    )

    error_message = "Invalid storage class."
  }
}

# ==========================================================================
# Security Configuration
# ==========================================================================

variable "uniform_bucket_level_access" {
  description = "Enable Uniform Bucket-Level Access."

  type = bool

  default = true
}

variable "public_access_prevention" {
  description = "Public Access Prevention mode."

  type = string

  default = "enforced"

  validation {
    condition = contains(
      [
        "inherited",
        "enforced"
      ],
      var.public_access_prevention
    )

    error_message = "Value must be inherited or enforced."
  }
}

# ==========================================================================
# Versioning
# ==========================================================================

variable "versioning_enabled" {
  description = "Enable bucket object versioning."

  type = bool

  default = true
}

# ==========================================================================
# Lifecycle
# ==========================================================================

variable "force_destroy" {
  description = "Allow Terraform to delete a non-empty bucket."

  type = bool

  default = false
}

# ==========================================================================
# Metadata
# ==========================================================================

variable "labels" {
  description = "Labels applied to the bucket."

  type = map(string)

  default = {}
}
