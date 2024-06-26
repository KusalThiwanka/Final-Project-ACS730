# Module to deploy basic networking 
module "project-network" {
  source               = "../Modules/aws_network"
  profile              = var.profile
  region               = var.region
  env                  = var.env
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  prefix               = var.prefix
  default_tags         = var.default_tags
}

# Test 5