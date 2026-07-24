locals {

  ###########################################################################
  # Naming Convention
  ###########################################################################

  prefix = "${var.environment}-${var.project_id}"

  names = {

    # Terraform
    terraform_state_bucket = "${var.project_id}-terraform-state"

    # Artifact Registry
    platform_images = "platform-images"
    helm_charts     = "helm-charts"
    base_images     = "base-images"

    # Future Resources
    hub_vpc           = "${local.prefix}-hub-vpc"
    prod_spoke_vpc    = "${local.prefix}-prod-spoke"
    nonprod_spoke_vpc = "${local.prefix}-nonprod-spoke"

    cloud_router = "${local.prefix}-router"
    cloud_nat    = "${local.prefix}-nat"

    gke_cluster = "${local.prefix}-gke"

    terraform_sa = "${local.prefix}-terraform-sa"
    github_sa    = "${local.prefix}-github-sa"
    workload_sa  = "${local.prefix}-workload-sa"
  }

  ###########################################################################
  # Common Labels
  ###########################################################################

  labels = {
    managed_by  = "terraform"
    project     = "enterprise-platform"
    environment = var.environment
    owner       = var.owner
  }

}
