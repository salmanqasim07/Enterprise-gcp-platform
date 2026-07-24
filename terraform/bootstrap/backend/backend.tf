/*
|--------------------------------------------------------------------------
| SalmanStack Cloud Platform (SSCP)
|--------------------------------------------------------------------------
|
| File        : backend.tf
| Component   : Terraform Backend Bootstrap
| Description : Configures Google Cloud Storage as the remote backend
|               for Terraform state.
|
| Notes:
| - This file is created only after the state bucket exists.
| - Terraform state will be stored remotely in GCS.
| - State locking is handled automatically by the GCS backend.
|
|--------------------------------------------------------------------------
*/

terraform {

  backend "gcs" {

    # -------------------------------------------------------------------------
    # Remote State Bucket
    # -------------------------------------------------------------------------

    bucket = "ss-tfstate-1066568188007"

    # -------------------------------------------------------------------------
    # State File Prefix
    # -------------------------------------------------------------------------

    prefix = "bootstrap"

  }

}
