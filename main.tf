variable "res_count" {
  type    = number
  default = 2
}

resource "null_resource" "null" {
  count = var.res_count
}

output "test" {
  value = "chaim"
}
