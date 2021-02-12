variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to build in"
}

variable "az_count" {
  type        = number
  default     = 2
  description = "The number of availability zones to use.  Must be at least 2 to support load balancing."
}
variable "route53_root_fqdn" {
  type        = string
  description = "The fqdn of a route53 zone owned by this account to build everything into"
}
variable "vpc_cidr" {
  type        = string
  default     = "10.69.0.0/16"
  description = "The CIDR of the full VPC"
}
variable "tags" {
  type = map(string)
  default = {
    Terraform   = "true"
    github_repo = "https://github.com:/DevOps4DeFi/terraform-baseline"
  }
}