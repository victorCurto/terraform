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

```
$ terraform init

// specify a plan
$ terraform plan

// run the plan and perform the actions
$ terraform apply

// remove all the instances that terraform create
$ terraform destroy
```

## Glossary
- IAM - Identity and Access Management
- AMI - Amazon Machine Images
- EC2 - Elastic Compute Cloud