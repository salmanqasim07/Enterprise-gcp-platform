################################################################################
# Project Information
################################################################################

output "project_id" {
  description = "Google Cloud Project ID"
  value       = var.project_id
}

#output "project_number" {
# description = "Google Cloud Project Number"
# value       = data.google_project.current.number
#}

output "region" {
  description = "Default deployment region"
  value       = var.region
}

################################################################################
# Terraform Backend
################################################################################

output "terraform_state_bucket" {
  description = "Terraform remote state bucket"
  value       = google_storage_bucket.terraform_state.name
}

################################################################################
# Artifact Registry
################################################################################

output "platform_images_repository" {
  description = "Platform images repository"
  value       = google_artifact_registry_repository.platform_images.name
}

output "helm_charts_repository" {
  description = "Helm charts repository"
  value       = google_artifact_registry_repository.helm_charts.name
}

output "base_images_repository" {
  description = "Base images repository"
  value       = google_artifact_registry_repository.base_images.name
}


output "artifact_registry_hostname" {
  description = "Artifact Registry hostname"
  value       = "${var.region}-docker.pkg.dev"
}
