locals {
  required_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "artifactregistry.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "secretmanager.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "dns.googleapis.com"
  ]
}

resource "google_project_service" "required_apis" {
  for_each = toset(local.required_apis)

  project = var.project_id
  service = each.value

  disable_dependent_services = false
  disable_on_destroy         = false
}

################################################################################
# Terraform State Bucket
################################################################################

resource "google_storage_bucket" "terraform_state" {

  name     = "${var.project_id}-terraform-state"
  project  = var.project_id
  location = var.region

  storage_class = "STANDARD"

  uniform_bucket_level_access = true

  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 365
    }

    action {
      type = "Delete"
    }
  }

  labels = local.labels

  depends_on = [
    google_project_service.required_apis
  ]
}
