module "ourGraph" {
  source                         = "github.com/DevOps4DeFi/ourGraph"
  route53_root_fqdn              = var.route53_root_fqdn
  aws_keypair_name               = "ben.leibig@gmail.com"
  ethnode_url_ssm_parameter_name = "/DevOps4Defi/ethnode_url"
  region                         = module.baseline.region
  vpc_id                         = module.baseline.vpc_id
  public_subnet_ids              = module.baseline.public_subnet_ids
  subgraph_github_repos          = ["https://github.com/Badger-Finance/badger-subgraph"]
}