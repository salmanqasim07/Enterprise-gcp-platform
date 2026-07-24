terraform {
  backend "gcs" {
    bucket = "ss-bootstrap-prj-terraform-state"
    prefix = "bootstrap/state"
  }
}
