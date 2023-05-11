terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

#VPC
resource "aws_vpc" "subashvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "subashvpc"
  }
}

#SUBNET [PUB/PVT]
resource "aws_subnet" "SUB-PUB" {
  vpc_id     = aws_vpc.subashvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone ="ap-south-1a"

  tags = {
    Name = "SUB-PUB"
  }
}

#SECURITY GROUP
resource "aws_security_group" "MYSG-PUB" {
  name        = "SecPub"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.subashvpc.id

  ingress {
    description      = "HTTPS"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MYSG-PUB"
  }
}

#WEBSERVER
resource "aws_instance" "EC2-start" {
  ami           = "ami-022d03f649d12a49d"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "subashlinux"
  subnet_id = aws_subnet.SUB-PUB.id
  vpc_security_group_ids = [aws_security_group.MYSG-PUB.id]

  tags = {
    Name = "EC2-start"
  }
}
