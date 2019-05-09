terraform {
  backend "atlas" {
    name = "chavo4/tf-remote-backend"
  }
}

resource "null_resource" "helloWorld1" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}
