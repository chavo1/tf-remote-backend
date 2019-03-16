terraform {
  backend "atlas" {
    name = "chavo4/tf-remote-state-old"
  }
}

resource "null_resource" "helloWorld" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}

output "helloWorld" {
  value = "${null_resource.helloWorld.id}"
}

data "terraform_remote_state" "helloWorld" {
  backend = "atlas"

  config = {
    name = "chavo4/tf-remote-state-old"
  }
}

output "helloWorld_data" {
  value = "${data.terraform_remote_state.helloWorld.helloWorld}"
}
