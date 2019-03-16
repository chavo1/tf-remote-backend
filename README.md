# Terraform Atlas backend
This repo containt an example how to create TF remote state with  TF "[null_resource](https://www.terraform.io/docs/provisioners/null_resource.html)".
Also how to retrieves state data from a Terraform backend. This allows you to use the root-level outputs of one or more Terraform configurations as input data for another configuration.

The providers for [Terraform 0.12](https://www.hashicorp.com/blog/terraform-0-1-2-preview) could be found [HERE](http://terraform-0.12.0-dev-snapshots.s3-website-us-west-2.amazonaws.com/)

- The test could be done with [Vagrant](https://www.vagrantup.com/) - just specify the needed Terraform version in Vagrantfile

1. Fork the repo and clone it to your environment.
```
git clone https://github.com/chavo1/tf-remote-backend.git
cd tf-remote-backend/tf11_remote_state
```
2. Open "main.tf" and delete following rows:
```
terraform {
backend "atlas" {
name  =  "chavo4/tf-remote-backend"
  }
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

```
3. Now create a local "terraform.tfstate"
```
terraform fmt
terraform init
teraform apply
```
4. Create a new workspace in [TFE](https://app.terraform.io) under your Org.
5. Open "main.tf" and add again deleted rows from step 2 with needed organization name and workspace - in my example the org is "chavo4".
6. Save and execute:
```
terraform fmt
terraform init
teraform apply
```
7. Now you will be asking to provide a TFE token which can be generated under your TFE User Settings --> [Tokens](https://app.terraform.io/app/settings/tokens). Paste it and confirm with "yes" or you can export the token:

export ATLAS_TOKEN=<Your Atlas Token>

More about Terraform Remote State can be found [HERE](https://www.terraform.io/docs/state/remote.html) 
