module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = "${local.env}-${lookup(local.region, local.env)}"
  region               = lookup(local.region, local.env)
  vpc_cidr_block       = var.vpc["vpc_cidr"][local.env][lookup(local.region, local.env)][0]
  private_subnet_cidrs = var.vpc["private_subnet_cidrs"][local.env][lookup(local.region, local.env)]
  public_subnet_cidrs  = var.vpc["public_subnet_cidrs"][local.env][lookup(local.region, local.env)]

}

module "rds" {
  source = "./modules/rds"

  name                      = "${local.env}-postgres-db"
  storage                   = 30
  db_engine                 = "postgres"
  db_engine_version         = "16.4"
  db_instance_class         = "db.t3.micro"
  db_username               = "postgresql"
  db_password               = var.db_password
  vpc_id                    = module.vpc.vpc_id
  port                      = 5432
  subnet_ids                = [for subnet in module.vpc.private_subnets : subnet.id] 
    
}

module "ec2_instance" {
  source = "./modules/ec2"

  instance_name   = "final-project-instance"
  instance_type   = "t3.small"
  ami_id          = "ami-01938df366ac2d954"  # Replace with a valid AMI ID
  key_name        = "final-project-key"  # Replace with your key pair name
  subnet_id       = lookup(module.vpc.public_subnets[0], "id")
  vpc_id          = module.vpc.vpc_id 
  
}
 