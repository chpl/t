terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

variable "input" {}

resource "random_pet" "this" {}

output "test" {
  value = "chaim"
}

output "pet_name" {
  value = random_pet.this.id
}

output "from_input" {
  value = var.input
}