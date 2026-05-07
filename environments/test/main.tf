locals {
  common_tags = {
    Environment = var.environment
    Project     = var.project
    ManagedBy   = "Terraform"
  }
}

# Example resource — replace or extend with your actual infrastructure
resource "aws_s3_bucket" "example" {
  bucket = "${var.project}-${var.environment}-example"
  tags   = local.common_tags
}
