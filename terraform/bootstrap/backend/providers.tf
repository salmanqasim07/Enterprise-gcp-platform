/*
|--------------------------------------------------------------------------
| SalmanStack Cloud Platform (SSCP)
|--------------------------------------------------------------------------
|
| File        : providers.tf
| Component   : Terraform Backend Bootstrap
| Description : Configures the Google Cloud provider used by Terraform.
|
| Notes:
| - This provider authenticates using the active gcloud credentials.
| - In CI/CD, this will later be replaced with Workload Identity Federation.
|
|--------------------------------------------------------------------------
*/

# -----------------------------------------------------------------------------
# Google Cloud Provider
# -----------------------------------------------------------------------------
provider "google" {

  # Google Cloud project where bootstrap resources will be created.
  project = var.project_id

  # Default region for regional resources.
  region = var.region

  # Default zone (used when a zonal resource is required).
  zone = var.zone
}



#Why don't we specify credentials?

#You'll notice we don't have:

#credentials = file("key.json")

#because:

#❌ Service account keys should never be committed to Git.
#❌ Long-lived keys are discouraged by Google.
#✅ During local development, Terraform automatically uses your authenticated gcloud session (gcloud auth application-default login when needed).
#✅ Later, in GitHub Actions, we'll authenticate using Workload Identity Federation, which eliminates service account keys entirely.

#This is the modern, recommended approach.
