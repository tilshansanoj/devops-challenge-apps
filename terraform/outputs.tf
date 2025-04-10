# output "alb-dns" {
#   description = "ALB DNS endpoint"
#   value       = module.alb.alb-dns
# }

output "vpc-id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc-cidr" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "private-subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public-subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

# output "cluster-id" {
#   description = "The ID of the load balancer"
#   value       = module.cluster.id
# }

# output "alb-arn" {
#   description = "The ARN of the load balancer"
#   value       = module.alb.alb-arn
# }

# output "https-listener-arn" {
#   value = module.alb.https-listener-arn
# }

output "ec2_instance_ip" {
  value = module.ec2_instance.public_ip
}