terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
    region = "ap-south-1" 
}

resource "aws_instance" "subash" {
  ami           = "ami-02eb7a4783e7e9317" 
  instance_type = "t2.micro"
  tags = {
      Name = "TF-subash"
  }
}
