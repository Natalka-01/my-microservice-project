terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-nata-0010012026"
    key            = "lesson-5/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}