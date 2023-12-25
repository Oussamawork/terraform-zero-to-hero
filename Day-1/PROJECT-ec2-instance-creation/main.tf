provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
    ami           = "ami-0759f51a90924c166"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
    subnet_id = "subnet-0aed9540ef875bc53"
    key_name = "myKePair"
}