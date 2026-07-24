/*
|--------------------------------------------------------------------------
| SalmanStack Cloud Platform (SSCP)
|--------------------------------------------------------------------------
|
| File        : versions.tf
| Component   : Landing Zone - Folders
| Description : Defines the required Terraform version and provider versions
|               for managing the Google Cloud folder hierarchy.
|
|--------------------------------------------------------------------------
*/

terraform {

  # ---------------------------------------------------------------------------
  # Minimum Terraform Version
  # ---------------------------------------------------------------------------

  required_version = ">= 1.13.0"

  # ---------------------------------------------------------------------------
  # Required Providers
  # ---------------------------------------------------------------------------

  required_providers {

    google = {
      source  = "hashicorp/google"
      version = "~> 7.2"
    }

  }

}
