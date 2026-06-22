resource "null_resource" "null" {
  provisioner "local-exec" {
    command = "for i in $(seq 1 3000); do echo \"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain # $i at $(date +%T.%N)\"; sleep 0.05; done"
  }
}
