locals {
  # Load the relevant env.hcl file based on where terragrunt was invoked. This works because find_in_parent_folders
  # always works at the context of the child configuration.
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  vpc_cidr             = local.env_vars.locals.vpc_cidr
  public_subnet_cidr   = local.env_vars.locals.public_subnet_cidr
  private_subneta_cidr = local.env_vars.locals.private_subneta_cidr
  private_subnetb_cidr = local.env_vars.locals.private_subnetb_cidr

}

include "provider" {
  path = find_in_parent_folders()
}

include "backend" {
  path = find_in_parent_folders("backend.hcl")
}

terraform {
  source = "../../../modules//vpc"
}

inputs = {
  VPC_cidr             = local.vpc_cidr
  public_subnet_cidr   = local.public_subnet_cidr
  private_subneta_cidr = local.private_subneta_cidr
  private_subnetb_cidr = local.private_subnetb_cidr
}