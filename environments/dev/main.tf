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

# Import existing bucket created via CLI into Terraform state
import {
  to = aws_s3_bucket.pipeline_test
  id = "jt-test-bucket-pipeline-000000"
}

# jt-test-bucket-pipeline-000000
resource "aws_s3_bucket" "pipeline_test" {
  bucket = "jt-test-bucket-pipeline-000000"
  tags   = local.common_tags
}

resource "aws_s3_bucket_versioning" "pipeline_test" {
  bucket = aws_s3_bucket.pipeline_test.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "pipeline_test" {
  bucket = aws_s3_bucket.pipeline_test.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "pipeline_test" {
  bucket                  = aws_s3_bucket.pipeline_test.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "pipeline_test" {
  bucket = aws_s3_bucket.pipeline_test.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "pipeline_test" {
  bucket = aws_s3_bucket.pipeline_test.id
  rule {
    id     = "expire-old-versions"
    status = "Enabled"
    filter {
      prefix = ""
    }
    noncurrent_version_expiration {
      noncurrent_days = 90
    }
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}

resource "aws_s3_bucket_policy" "pipeline_test" {
  bucket = aws_s3_bucket.pipeline_test.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyNonTLS"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.pipeline_test.arn,
          "${aws_s3_bucket.pipeline_test.arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

# jt-test-bucket-pipeline-000001
resource "aws_s3_bucket" "pipeline_test_1" {
  bucket = "jt-test-bucket-pipeline-000001"
  tags   = local.common_tags
}

resource "aws_s3_bucket_versioning" "pipeline_test_1" {
  bucket = aws_s3_bucket.pipeline_test_1.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "pipeline_test_1" {
  bucket = aws_s3_bucket.pipeline_test_1.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "pipeline_test_1" {
  bucket                  = aws_s3_bucket.pipeline_test_1.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "pipeline_test_1" {
  bucket = aws_s3_bucket.pipeline_test_1.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "pipeline_test_1" {
  bucket = aws_s3_bucket.pipeline_test_1.id
  rule {
    id     = "expire-old-versions"
    status = "Enabled"
    filter {
      prefix = ""
    }
    noncurrent_version_expiration {
      noncurrent_days = 90
    }
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}

resource "aws_s3_bucket_policy" "pipeline_test_1" {
  bucket = aws_s3_bucket.pipeline_test_1.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyNonTLS"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.pipeline_test_1.arn,
          "${aws_s3_bucket.pipeline_test_1.arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

# jt-test-bucket-claude-mem-000001
resource "aws_s3_bucket" "claude_mem_000001" {
  bucket = "jt-test-bucket-claude-mem-000001"
  tags   = local.common_tags
}

resource "aws_s3_bucket_versioning" "claude_mem_000001" {
  bucket = aws_s3_bucket.claude_mem_000001.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "claude_mem_000001" {
  bucket = aws_s3_bucket.claude_mem_000001.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "claude_mem_000001" {
  bucket                  = aws_s3_bucket.claude_mem_000001.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "claude_mem_000001" {
  bucket = aws_s3_bucket.claude_mem_000001.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "claude_mem_000001" {
  bucket = aws_s3_bucket.claude_mem_000001.id
  rule {
    id     = "expire-old-versions"
    status = "Enabled"
    filter {
      prefix = ""
    }
    noncurrent_version_expiration {
      noncurrent_days = 90
    }
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}

resource "aws_s3_bucket_policy" "claude_mem_000001" {
  bucket = aws_s3_bucket.claude_mem_000001.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyNonTLS"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.claude_mem_000001.arn,
          "${aws_s3_bucket.claude_mem_000001.arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}
