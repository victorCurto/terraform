# Terraform
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

### Terraform structure folder/files
- TERRAFORM/ -> contains all the providers (binaries) that the project needs
- terraform.tfstate -> contains the current state of the project
- terraform.lock.hcl -> it's a lock version (used like in npm) that locking external dependencies, like providers, modules. Created when terraform init

----
Terraform objects:
- (input varialbes) var.
- (data variables) data.
- local.
- each.

### Terraform best practives

1) __Create a separated file for input and output variables__ but this files must be in the same folder
    - variable.tf
    - output.tf
2) __Create a special file 'terraform.tfvars'__ that will contains key=value pairs of the default values of variables (we don't need to specify the default value in the variable.tf file)
    - terraform.tfvars

3) __Use Local variables__<br>
    Ex.
    ```
    locals {
        http_port = 80
    }

    ....
    port = local.http_port //To use a local variable
    ....
    ```


4) __Use Terraform workspace__
Terraform workspaces will help you manage multiple states in multiple environments - by default we have the "default" workspace
```
$ terraform workspace list
$ terraform workspace --help
```

- Create another workspace
Workspaces isolate their state, so if you run "terraform plan" Terraform will not see any existing state
for this configuration.
```
$ terraform workspace new qa
```

__We can also apply workspace in code to specify/isolate some configurations:__
```
resource "aws_instance" "example" {
    ami             = "ami-1234"
    instance_type   = terraform.workspace == "dev" ? "t2.micro" : "t2.medium"
}
```

5) __Setup remote backend to hold the state file__
- Setup S3 bucket to hold state file
- Setup DynamoDB to support locking
- Configure AWS provider to use these two

When we run terraform commands:
1. Terraform acquires lock before running plan and apply
2. Terraform saves state to the S3 bucket

6) __Use modules to organize share/reusability code__<br>

A module is just other file in some other folder and to import the module we just need to 

```
module "my-s3-module" {
  source = "./modules/s3-module"
}
```
After create modules/submodules we need to run 
```
$ terraform init
```

>We can use official modules from Terraform registry 
 https://registry.terraform.io/

### Terraform dependencies
- API calls happen in parallel if no dependencies
- Terraform auto-orders based on dependencies
- Explicit dependency
    ```
    resource "aws_s3_bucket" "images"{}
    
    resource "aws_s3_bucket" "images_bkp"{
        dependes_on = [
            aws_s3_bucket.images
        ]
    }
    ```

### Terraform graph
Enable us to see a graph with all the dependenciesthat we have
```
$ terraform graph
$ terraform graph > graph.dot
```
And then we can use some online tool to see the graph like https://dreampuf.github.io/GraphvizOnline/
or with a pluging in your IDE





## Glossary
- IAM - Identity and Access Management
- AMI - Amazon Machine Images
- EC2 - Elastic Compute Cloud
- S3 - Simple Storage Service
- vpc - Virtual private clouds
    - subnet - is a range of IP addresses in your VPC.
- DynamoDB -Amazon DynamoDB is a fully managed, serverless, key-value NoSQL database designed to run high-performance applications at any scale
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