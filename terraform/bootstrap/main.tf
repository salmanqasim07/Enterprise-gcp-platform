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


################################################################################
# Artifact Registry - Platform Images
################################################################################

resource "google_artifact_registry_repository" "platform_images" {

  project  = var.project_id
  location = var.region

  repository_id = "platform-images"

  description = "Platform container images"

  format = "DOCKER"

  labels = local.labels

  depends_on = [
    google_project_service.required_apis
  ]
}

################################################################################
# Artifact Registry - Helm Charts
################################################################################

resource "google_artifact_registry_repository" "helm_charts" {

  project  = var.project_id
  location = var.region

  repository_id = "helm-charts"

  description = "OCI Helm Charts"

  format = "DOCKER"

  labels = local.labels

  depends_on = [
    google_project_service.required_apis
  ]
}


################################################################################
# Artifact Registry - Base Images
################################################################################

resource "google_artifact_registry_repository" "base_images" {

  project  = var.project_id
  location = var.region

  repository_id = "base-images"

  description = "Enterprise base images"

  format = "DOCKER"

  labels = local.labels

  depends_on = [
    google_project_service.required_apis
  ]
}


################################################################################
# Current Project
################################################################################

#data "google_project" "current" {
#  project_id = var.project_id
#}

################################################################################
# Billing Budget
################################################################################

#resource "google_billing_budget" "project_budget" {

# billing_account = var.billing_account_id

#display_name = "${var.project_id} Budget"

#budget_filter {
# projects = [
#  "projects/${data.google_project.current.number}"
#]
#}

#amount {
#  specified_amount {
#    currency_code = "USD"
#    units         = "100"
#  }
#}

#threshold_rules {
#  threshold_percent = 0.50
#}

#threshold_rules {
#  threshold_percent = 0.75
#}

#threshold_rules {
#  threshold_percent = 0.90
#}

#threshold_rules {
#  threshold_percent = 1.00
# }

#  all_updates_rule {
#    monitoring_notification_channels = []

#    disable_default_iam_recipients = false
#  }
#}
