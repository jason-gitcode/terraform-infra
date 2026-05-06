terraform {
  backend "s3" {
    bucket         = "jt-terraform-state-central"
    key            = "business-test/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
