#/*
#|--------------------------------------------------------------------------
#| SalmanStack Cloud Platform (SSCP)
#|--------------------------------------------------------------------------
#|
#| Module        : Storage Bucket
#| Purpose       : Creates a secure and reusable Google Cloud Storage bucket.
#|
#| Description:
#| This module provisions Google Cloud Storage buckets following
#| SalmanStack enterprise standards.
#|
#| Features:
#| - Uniform Bucket-Level Access
#| - Versioning
#| - Public Access Prevention
#| - Labels
#| - Lifecycle Rules
#|
#| Maintainer    : SalmanStack Platform Team
#| Terraform     : >= 1.13
#| Provider      : hashicorp/google
#|
#|--------------------------------------------------------------------------
#*/

terraform {

  # -----------------------------------------------------------------------
  # Minimum Terraform version required by this module.
  # -----------------------------------------------------------------------
  required_version = ">= 1.13.0"

  required_providers {

    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }

  }

}


#/*Why start with versions.tf?

#Because every module starts with its contract:

#Which Terraform version?
#Which provider?
#Which provider version?

#If someone tries to use Terraform 1.8 in two years, Terraform will fail immediately instead of producing unexpected behavior.

#*/
