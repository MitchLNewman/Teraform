variable "ami-id" {
  description = "AMI ID of ubuntu 22.04LTS eu-west-2"
  default     = "ami-0eb260c4d5475b901"
}

variable "instance-type" {
  description = "Free tier EC2 instance type"
  default     = "t2.micro"
}

variable "pem-key" {
  description = "Associated key to SSH into the EC2 instance"
  default     = "example"
}