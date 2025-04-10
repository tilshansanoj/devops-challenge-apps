locals {
  deployments = {
    tms-backend = {
      port              = 3003
      cpu               = 256
      memory            = 512
      rule_priority     = 500
      task_count        = 1
      image             = var.image
      health_check_path = "/swagger-api"
      host_prefix       = "tms-backend"
    }
  }
}