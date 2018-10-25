# Terraform Atlas backend
This repo containt an example how to create TF remote state with  TF "[null_resource](https://www.terraform.io/docs/provisioners/null_resource.html)" and GitHub repo:

```
![alt text](https://mermaidjs.github.io/mermaid-live-editor/#/view/eyJjb2RlIjoiZ3JhcGggTFJcbkFbKi50Zl0gLS0-IEIodGVycmFmb3JtLnRmc3RhdGUpXG5CIC0tPiBDe1RGRX0iLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9fQ)
```
1.  Fork the repo and clone it tou your environment.
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
```
4. Create a new workspace in [TFE](https://app.terraform.io) under your Org.
5. Open "main.tf" and add again deleted rows from step 2 with needed organization in my example it is "chavo4".
6. Save and repeat step 3.
7. Now you will be asking to provide a TFE token which can be genarate under your User Settings --> [Tokens](https://app.terraform.io/app/settings/tokens). Paste it and confirm with "yes".
