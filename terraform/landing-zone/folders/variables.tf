/*
|--------------------------------------------------------------------------
| SalmanStack Cloud Platform (SSCP)
|--------------------------------------------------------------------------
|
| File        : variables.tf
| Component   : Landing Zone - Folders
| Description : Defines the input variables required to create the
|               SalmanStack enterprise folder hierarchy.
|
|--------------------------------------------------------------------------
*/

# =============================================================================
# Google Cloud Organization Configuration
# =============================================================================

variable "organization_id" {

  description = "Google Cloud Organization ID where the folder hierarchy will be created."

  type = string

  nullable = false

  validation {

    condition = length(trimspace(var.organization_id)) > 0

    error_message = "The organization_id cannot be empty."

  }

}

# =============================================================================
# Bootstrap Project Configuration
# =============================================================================

variable "bootstrap_project_id" {

  description = "Bootstrap project ID used by the Google provider."

  type = string

  nullable = false

  validation {

    condition = length(trimspace(var.bootstrap_project_id)) > 0

    error_message = "The bootstrap_project_id cannot be empty."

  }

}

# =============================================================================
# Default Google Cloud Region
# =============================================================================

variable "default_region" {

  description = "Default Google Cloud region used by the provider."

  type = string

  default = "us-central1"

}

# =============================================================================
# Default Google Cloud Zone
# =============================================================================

variable "default_zone" {

  description = "Default Google Cloud zone used by the provider."

  type = string

  default = "us-central1-a"

}
