variable "aws_region" { 
	default = "ap-south-1" 
 } 
variable "aws_secret_key" {} 
variable "aws_access_key" {} 

provider "aws" { 
	region = var.aws_region 
    access_key = var.aws_access_key 
    secret_key = var.aws_secret_key 
} 

resource "aws_instance" "subash" {
  ami           = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  tags = {
      Name = "subash"
  }
}
