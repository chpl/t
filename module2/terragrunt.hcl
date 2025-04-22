locals {
  common = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

remote_state = local.common.remote_state

terraform {
  source = "../shared"
}

inputs = {
  prefix = "module2"
}