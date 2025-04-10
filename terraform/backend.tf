terraform {
  backend "s3" {
    bucket = "s3-tilshansanoj"
    key    = "infastructure/terraform.tfstate"
    region = "ap-southeast-1"
  }
}