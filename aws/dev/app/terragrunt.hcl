locals {
  # Load the relevant env.hcl file based on where terragrunt was invoked. This works because find_in_parent_folders
  # always works at the context of the child configuration.
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  database_name     = local.env_vars.locals.database_name
  database_user     = local.env_vars.locals.database_user
  database_password = local.env_vars.locals.database_password

}

include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "database" {
  config_path = "../database"
}

terraform {
  source = "../../../modules//apps"
}

inputs = {
  subnet_id         = dependency.vpc.outputs.public_subnet_id
  public_key        = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQlOHhthJ3XkDxkDM3gab0GJtJGVtSpHuzFwpg9ICUoxhiKaFTXZy2rKLbQAUioexK6Uw1fEXCNYEdVU8+7KJOBTKOEsOAI1pNswBZOa+t+a4iFhkD1dyJbO/KlURzBkUzVuQ/CqX4Z/wCEJUaLFptOUTP0uKIT4KXsBmTJSsIooP3oieEughQsHVsmUAVCSmJea5HP39NoSUx5udRZUfBSqKCEPL1jW/QwiTPjyveX+CzoK12cnyXnMHEGx7kQSmWPuGiptcybl3LAaALs5QjiRMrIRqLqhZLJ4s1hZ9TbVY0DG/AD4sacdco6asNUIOg0Zz8k3qKiO81+Vm2YzSJ test-sg"
  vpc_id            = dependency.vpc.outputs.vpc_id
  instance_count    = 1
  root_volume_size  = 20
  db_endpoint       = dependency.database.outputs.db_endpoint
  database_name     = local.database_name
  database_user     = local.database_user
  database_password = local.database_password
}