variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "asia-south1"
}

variable "zone" {
  description = "Google Cloud zone"
  type        = string
  default     = "asia-south1-a"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "shared"
}

variable "owner" {
  description = "Infrastructure owner"
  type        = string
}
#variable "billing_account_id" {
#  description = "Google Cloud Billing Account ID"
#  type        = string
#}
