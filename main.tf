variable "res_count" {
  type = number
}

resource "null_resource" "null" {
  count = var.res_count
}

output "test" {
  value = "chaim"
}
