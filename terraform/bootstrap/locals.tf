locals {

  labels = {
    managed_by  = "terraform"
    project     = "enterprise-platform"
    environment = var.environment
    owner       = var.owner
  }

}
