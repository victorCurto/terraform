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

# import other modules
module "my-s3-module" {
  source = "./modules/s3-module"
  bucket_name = "passing_input_variable_to_module"
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
-> Output variables: ex. get a property from an existent resource
*/
output "public_ip" {
  value       = aws_instance.app_server.public_ip
  description = "The public IP address of the web server"
}

/*
-> Data variables: enable us to perform queries against the provider to get some data
to access: data.aws_vpc.default
*/
/*
data "aws_vpc" "default" {
  default = true
}
data "aws_subnet_ids" "subnet_ids" {
  vpc_id = data.aws_vpc.default.id
}

output "aws_default_vpc_info" {
  value = data.aws_vpc.default
  description = "info about default VPC"
}

output "aws_default_vpc_subnet_ids" {
  value = data.aws_subnet_ids.subnet_ids
  description = "Subnet IDs"
}
*/

/*
=> resources block - resource "type" "name" 
*/
resource "aws_instance" "app_server" {
  ami                    = "ami-03f65b8614a860c29"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_port_8080.id]
  //user_data enables you to execute commands, and '<<-EOF ....EOF' execute blocks of commands
  user_data = <<-EOF
        #!/bin/bash
        echo "<h1>My server is up!</h1>" > index.html
        nohup busybox httpd -f -p ${var.port_number}
      EOF
  //tags specify the name in aws resources
  tags = {
    Name = "ec2-${var.app_tag_name}"
  }
}


resource "aws_security_group" "allow_port_8080" {
  name        = "allow_port_8080"
  description = "Allow 8080 inbound traffic"

  ingress {
    from_port   = var.port_number
    to_port     = var.port_number
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sg-${var.app_tag_name}"
  }

}

/*
resource "aws_vpc" "app_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.app_tag_name
  }
}
*/