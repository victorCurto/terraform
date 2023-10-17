// 1 specify the provider block - provider "name"
provider "aws" {
    profile = "default"
    region = "us-west-2"
}

// Start creating resources - resource "type" "name"
resource "aws_instance" "app_server" {
    ami = "ami-0989fb15ce71ba39e"
    instance_type = "t2.micro"
}