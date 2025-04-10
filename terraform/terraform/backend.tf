terraform {
  backend "s3" {
    bucket = "terraform-states-wireapps"
    key    = "tms-backend/terraform.tfstate"
    region = "ap-southeast-1"
  }
}