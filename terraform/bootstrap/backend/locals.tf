/*
|--------------------------------------------------------------------------
| SalmanStack Cloud Platform (SSCP)
|--------------------------------------------------------------------------
|
| File        : locals.tf
| Component   : Terraform Backend Bootstrap
| Description : Local values shared across bootstrap resources.
|
| Purpose:
| - Avoid duplicated values.
| - Centralize labels.
| - Keep resources clean and readable.
|
|--------------------------------------------------------------------------
*/

# -----------------------------------------------------------------------------
# Common Labels
#
# These labels are applied to all resources created by this Terraform
# configuration. Using a centralized local ensures consistency across the
# project and makes filtering resources in Google Cloud easier.
# -----------------------------------------------------------------------------

locals {

  common_labels = {
    company     = "salmanstack"
    project     = "enterprise-gcp-platform"
    component   = "terraform-backend"
    environment = "bootstrap"
    managed_by  = "terraform"
  }

}
