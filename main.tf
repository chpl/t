resource "null_resource" "null" {
  count = 1
}

output "test" {
  value = "chaim"
}
