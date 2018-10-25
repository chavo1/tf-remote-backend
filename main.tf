terraform {
  backend "atlas" {
    name = "chavo4/tf-remote-backend"
  }
}

resource "null_resource" "helloWorld" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}
