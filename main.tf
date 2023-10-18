/*
=> terraform block (not mandatory)
-> configures terraform settings
-> "expected" terraform version
-> Configures providers
-> source defines where the provider comes from
*/
terraform {
  // https://registry.terraform.io/providers/hashicorp/aws/
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}


/*
=> provider block - provider "local_name"
-> Contains provider settings
-> Configures a specific provider
-> Can have multiple pf these
-> Provider specific - can be different for different providers
*/
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

/*
-> Input variables
Reusable values of different data types (used with var namespace):
- it will ask you if you don't provide a default; 
Runtime values:
- you can provide via CLI args (-var "var_name=val"); 
- you can provide via Environment variables (TF_VAR_<var_name>);
*/
variable "app_tag_name" {
  description = "Enter tag name for all resources"
  type        = string
  #default     = "app" // if you don't specify the default it will ask or you need to 
}


/*
=> resources block - resource "type" "name" 
*/
resource "aws_instance" "app_server" {
  ami           = "ami-03f65b8614a860c29"
  instance_type = "t2.micro"
  //tags specify the name in aws resources
  tags = {
    Name = var.app_tag_name
  }
}

//resource "aws_s3_bucket" "my_bucket" {}

resource "aws_vpc" "app_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.app_tag_name
  }
}