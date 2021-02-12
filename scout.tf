### Disable the 2 resources below if you want to set your own password directly in ssm.
### You can find the password set here by looking in SSM parameter store on aws console
### or in terraform state
resource "random_pet" "grafana_admin_pw" {
  length = 4
}

resource "aws_ssm_parameter" "grafana_admin_password" {
  name  = "/DevOps4DeFi/grafana_admin_password"
  type  = "String"
  value = random_pet.grafana_admin_pw.id
}

module "scout" {
  source                          = "../scout" ## Requires access to scout repo on badger-finance
  ethnode_url_ssm_parameter_name  = "/DevOps4Defi/ethnode_url"
  region                          = "us-east-1"
  route53_root_fqdn               = module.baseline.route53_root_fqdn
  vpc_id                          = module.baseline.vpc_id
  public_subnet_ids               = module.baseline.public_subnet_ids
  prometheus_docker_image         = "bleibig/scout_prometheus"
  scout_docker_image              = "bleibig/scout_scout"
  grafana_docker_image            = "bleibig/scout_grafana"
  aws_keypair_name                = "ben.leibig@gmail.com"
  grafana_admin_password_ssm_name = aws_ssm_parameter.grafana_admin_password.name
  ebs_snapshot_id                 = "snap-074c4d8178bbc651e"
  public_lb_name                   = module.baseline.public_alb_name
  public_lb_https_listener_arn    = module.baseline.public_lb_https_listener_arn
  public_lb_sg_id =module.baseline.public_alb_sg_id
}
