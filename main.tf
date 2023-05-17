variable "aws_region" { 
	default = "ap-south-1" 
 } 
provider "aws" { 
	region = "ap-south-1"
    access_key = "AKIA3RJVOYKC4ZEMVPMQ"
    secret_key = "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"
} 
resource "aws_instance" "subash" {
  ami           = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  tags = {
      Name = "subash"
  }
}
