// 1 specify the provider block - provider "name"
provider "aws" {
    profile = "default"
    region = "us-west-2"
}

// Start creating resources - resource "type" "name"
resource "aws_instance" "app_server" {
    ami = "ami-03f65b8614a860c29" //"ami-830c94e3"
    instance_type = "t2.micro"
    //tags specify the name in aws resource
    tags = {
        Name = "my_app_server"
    }
}

resource "aws_s3_bucket" "my_bucket" {

}