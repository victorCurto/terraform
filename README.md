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
```

###  Run terraform

```
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
// if we just want to see the output
$ terraform output

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


### terraform best practives

1) Create a separated file for input and output variables but this files must be in the same folder
    - variable.tf
    - output.tf
2) Create a special file 'terraform.tfvars' that will contains key=value pairs of the default values of variables (we don't need to specify the default value in the variable.tf file)
    - terraform.tfvars

3) Use Local variables<br>
    Ex.
    ```
    locals {
        http_port = 80
    }

    ....
    port = local.http_port //To use a local variable
    ....
    ```
----
Terraform objects:
- var.
- local.
- each.


## Glossary
- IAM - Identity and Access Management
- AMI - Amazon Machine Images
- EC2 - Elastic Compute Cloud
- S3 - Simple Storage Service
- vpc - Virtual private clouds
    - subnet - is a range of IP addresses in your VPC.

----
## Syntax element - String Interpolation 
Using variables inside strings: "${...}"
```
....
  tags = {
    Name = "ec2-${var.app_tag_name}"
  }
.... 
```
Ex. Tag names based on resource
- EC2 tag - "ec2-app"
- Security group - "sg-app"


## Documentation
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

## ToDo
next - 32

https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started