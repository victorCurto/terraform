# terraform
This project is a guide to start/explore Terraform 


## Setups:
### Install AWS CLI locally

https://aws.amazon.com/cli/

- installing locally the aws cli

Validate
```
$ aws help
```

### Create an AWS account and authenticate with aws (.aws) 
- create an AWS account
- create an access key

```
$ aws configure
```
Provide the Access key and Secret access key



###  Install terraform
Instructions: https://developer.hashicorp.com/terraform/downloads

```
$ terraform version

// terraform init will pickup the versions on terraform.lock.hcl is exists
$ terraform init
// terraform will update the versions on terraform.lock.hcl
$ terraform init -upgrade

//Format the terraform file with default
$ terraform fmt


// specify a plan
$ terraform plan

// run the plan and perform the actions
$ terraform apply

// remove all the instances that terraform create
$ terraform destroy
```

To share the plan, or apply later, we create an output file plan (this is an internall file than terraform will understand):
```
$ terraform plan -out=myplan.tfplan
$ terraform apply ./myplan.tfplan
```




### terraform structure folder/files
- TERRAFORM/ -> contains all the providers (binaries) that the project needs
- terraform.tfstate -> contains the current state of the project
- terraform.lock.hcl -> it's a lock version (used like in npm) that locking external dependencies, like providers, modules. Created when terraform init


## Glossary
- IAM - Identity and Access Management
- AMI - Amazon Machine Images
- EC2 - Elastic Compute Cloud
- S3 - Simple Storage Service
- vpc - Virtual private clouds
    - subnet - is a range of IP addresses in your VPC.

## Documentation
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

## ToDo
next - 32

https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started