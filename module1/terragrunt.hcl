include "common" {
  path = find_in_parent_folders("common.hcl")
}

terraform {
  source = "../modules/external"
  extra_arguments "migrate" {
    commands = [
      "init",
    ]

    arguments = [
      "-migrate-state"
    ]
  }
}

inputs = {
  prefix = "module1"
}