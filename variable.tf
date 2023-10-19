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
  default     = "app" // if you don't specify the default it will ask or you need to 
}

variable "port_number" {
  description = "Port number where the web server runs"
  type = number
}



/*Types of variable
=> string
=> number
=> bool
=> list
=> map
=> object
=> set
=> tuple
=> any

Examples:

-> number  
variable "number_of_instances" { 
  description = "Number of EC2 instances"
  type =  number
  default = 3
}

-> List
variable "port_numbers"{
  dascription = "List of ports"
  type = list(number)
  default = [8080, 8081, 8082]
}

Lookup: var.port_number[0]

-> Map
variable "ec2_config"{
  dascription = "Config values for an EC2 instance"
  type = map(string)
  default = {
    ami_to_use = "ami-830c94e3"
    instance_type = "t2.micro"
    another_key = "another_value"
  }
}

-> Object
variable "ec2_config_object" {
  description = "Config value for an EC2 instance"
  type = object({
    ami_name = string
    count = number
    tags = list(string)
    enabled = bool
  })
  default = {
    ami_name = "ami-830c94e3"
    count = 3
    tags = ["app", "web", "prod"]
    enabled = true
  }
}

*/