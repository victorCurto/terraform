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

$ terraform init

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

## Glossary
- IAM - Identity and Access Management
- AMI - Amazon Machine Images
- EC2 - Elastic Compute Cloud
- S3 - Simple Storage Service

## Documentation
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

## ToDo
next - 21

https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started