data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket  = "terraform-state-ferry"
    key     = "env:/${local.env}/infastructure/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
    # assume_role = {
    #   role_arn = "arn:aws:iam::120854450311:role/Terraform-infra-role"
    # }
  }
}

module "webapp" {
  source            = "git::https://github.com/wireappsltd/infrastructure-modules/modules/fargate?ref=tms-backend"
  for_each          = local.deployments
  name              = each.key
  container_port    = each.value.port
  cpu               = each.value.cpu
  memory            = each.value.memory
  public_subnet_id  = [for subnet in data.terraform_remote_state.infra.outputs.public-subnets : subnet.id]
  ingress_cidr      = data.terraform_remote_state.infra.outputs.vpc-cidr
  vpc_id            = data.terraform_remote_state.infra.outputs.vpc-id
  cluster_id        = data.terraform_remote_state.infra.outputs.cluster-id
  listener_arn      = data.terraform_remote_state.infra.outputs.listener-arn
  rule_priority     = each.value.rule_priority
  task_count        = each.value.task_count
  image             = each.value.image
  health_check_path = each.value.health_check_path
  app_host          = "${each.value.host_prefix}.${data.terraform_remote_state.infra.outputs.vpc-primary-domain}"
  alb_dns           = data.terraform_remote_state.infra.outputs.alb-dns
  zone_id           = data.terraform_remote_state.infra.outputs.zone-id
  zone_id_private   = data.terraform_remote_state.infra.outputs.zone-id-private
}
