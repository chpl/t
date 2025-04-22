include "common" {
  path = find_in_parent_folders("common.hcl")
}

terraform {
  source = "../shared"
}

inputs = {
  prefix = "module2"
}