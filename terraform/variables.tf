variable "vpc" {
  type        = map(any)
  description = "VPC config for each environment"
  default = {
    vpc_cidr = {
      final-project = {
        ap-southeast-1 = ["10.16.0.0/16"]
      }
    }
    private_subnet_cidrs = {
      final-project = {
        ap-southeast-1 = ["10.16.2.0/24", "10.16.4.0/24", "10.16.6.0/24"]
      }
    }
    public_subnet_cidrs = {
      final-project = {
        ap-southeast-1 = ["10.16.20.0/24", "10.16.40.0/24", "10.16.60.0/24"]
      }
    }
  }
}


variable "db_password" {
  type    = string
  default = "postgres"
}

