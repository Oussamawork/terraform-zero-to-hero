#define an input variable for EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

#define an input variable for EC2 instance AMI ID
variable "ami_id" {
    description = "EC2 AMI ID"
    type = string
    default = "ami-0759f51a90924c166"
}

#configure the AWS provider using input variable
provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

#create an EC2 instance using the input variables
resource "aws_instance" "example" {
    ami           = var.ami_id  # Specify an appropriate AMI ID
    instance_type = var.instance_type
    subnet_id = "subnet-0aed9540ef875bc53"
    key_name = "myKePair"
}

#Define an output variabke to expose the public IP address of the EC2 instance
output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value = aws_instance.example.public_ip
}