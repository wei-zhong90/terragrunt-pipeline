locals {
  # Load the relevant env.hcl file based on where terragrunt was invoked. This works because find_in_parent_folders
  # always works at the context of the child configuration.
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  database_name     = local.env_vars.locals.database_name
  database_user     = local.env_vars.locals.database_user
  database_password = local.env_vars.locals.database_password
  vpc_cidr          = local.env_vars.locals.vpc_cidr

}

include "provider" {
  path = find_in_parent_folders()
}

include "backend" {
  path = find_in_parent_folders("backend.hcl")
}

dependency "vpc" {
  config_path = "../vpc"
}

terraform {
  source = "../../../modules//database"
}

inputs = {
  private_subenta_id = dependency.vpc.outputs.private_subnet_1_id
  private_subentb_id = dependency.vpc.outputs.private_subnet_2_id
  database_name      = local.database_name
  database_user      = local.database_user
  database_password  = local.database_password
  vpc_id             = dependency.vpc.outputs.vpc_id
  VPC_cidr           = local.vpc_cidr
}