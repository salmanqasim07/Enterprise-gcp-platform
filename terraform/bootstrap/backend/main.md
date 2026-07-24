Before We Write main.tf

I want to make one important architectural decision.

❌ Most tutorials do this
resource "google_storage_bucket" "terraform_state" {
  name     = var.terraform_state_bucket_name
  location = var.terraform_state_bucket_location
}

This works...

But it isn't production-ready.

Enterprise Requirements for a Terraform State Bucket

A Terraform state bucket should have:

Feature	Required	Why
Versioning	✅	Recover corrupted state
Uniform Bucket Level Access	✅	Security
Public Access Prevention	✅	Prevent accidental exposure
Labels	✅	Governance
Force Destroy	❌	Never delete state accidentally
Lifecycle Rules	✅	Manage object versions
Soft Delete	✅	Recover deleted objects (if supported)
CMEK	Later	After KMS is built
Retention Policy	Optional	Protect against accidental deletion
