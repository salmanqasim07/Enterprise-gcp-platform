Why do we use locals.tf?

A lot of engineers misunderstand locals.

Variables (var) are values that come from outside the module.

Locals (local) are values that are calculated or reused inside the module.

For example:

❌ Bad

labels = {
  application = "terraform"
  company     = "salmanstack"
  managed_by  = "terraform"
}

Then you copy the same labels to every resource.

✅ Good

labels = local.common_labels

Much cleaner.












Why don't we put everything in locals.tf?

Many people start putting bucket names, regions, project IDs, and everything else into locals.

Example:

locals {
  bucket_name = var.terraform_state_bucket_name
}

This adds no value because it just renames a variable.

Our rule will be:

Only use locals for values that are computed, reused multiple times, or represent shared configuration.
