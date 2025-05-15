resource "null_resource" "null" {
  count = 2
}

output "test" {
  value = "chaim"
}
