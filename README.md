# Terraform Atlas backend
This repo containt an example how to create TF remote state with  TF "[null_resource](https://www.terraform.io/docs/provisioners/null_resource.html)".

1. Fork the repo and clone it to your environment.
2. Open "main.tf" and delete following rows:
```
terraform {
backend "atlas" {
name  =  "chavo4/tf-remote-backend"
  }
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
```
7. Now you will be asking to provide a TFE token which can be genarate under your User Settings --> [Tokens](https://app.terraform.io/app/settings/tokens). Paste it and confirm with "yes".
