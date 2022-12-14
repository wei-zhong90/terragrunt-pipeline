remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "cicd-terraform-state-wei"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "cn-north-1"
    encrypt        = true
    dynamodb_table = "cicd-lock-table"
  }
}