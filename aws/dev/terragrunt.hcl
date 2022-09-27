generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  profile                 = "cn"
  region                  = "cn-north-1"
}
EOF
}