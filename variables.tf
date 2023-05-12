variable "ami" {
   type        = string
   description = "Linux ami ID"
   default     = "ami-02eb7a4783e7e9317"
}

variable "instance_type" {
   type        = string
   description = "Instance type"
   default     = "t2.micro"
}

variable "name_tag" {
   type        = string
   description = "Name of the EC2 instance"
   default     = "Jenkins-started"
}

