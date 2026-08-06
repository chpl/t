variable "total_duration_seconds" {
  type    = number
  default = 120
}

variable "sleep_interval_seconds" {
  type    = number
  default = 1
}

locals {
  iterations = ceil(var.total_duration_seconds / var.sleep_interval_seconds)
}

resource "null_resource" "null" {
  triggers = {
    always = uuid()
  }

  provisioner "local-exec" {
    command = "for i in $(seq 1 ${local.iterations}); do echo \"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain # $i at $(date +%T.%N)\"; sleep ${var.sleep_interval_seconds}; done"
  }
}
