module "baseline" {
  source            = "github.com/DevOps4DeFi/terraform-baseline"
  route53_root_fqdn = var.route53_root_fqdn
}
