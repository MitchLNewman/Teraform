provider "aws" {
  region = "eu-west-2"
  alias  = "aws-uk" # alias is used instead of default provider
}

variable "ami-uk" {
  description = "machine image uk"
  default     = "ami-f976839e"
}

variable "type" {
  default = "t2.micro"
}

variable "zone" {
  description = "map of availability zones for eu-west-2"
  # map variable to define availability zones
  default = {
    1 = "eu-west-2a"
    2 = "eu-west-2b"
  }
}

resource "aws_instance" "example" {
  provider = aws.aws-uk
  # for each to create two instances
  for_each = var.zone
  # each keyword used to set a value of the availability zone
  availability_zone = each.value
  ami               = var.ami-uk
  instance_type     = var.type

  # prevent destroy enabled
  lifecycle {
    # commented just to be able to destroy the mock instances
    #prevent_destroy = true
  }

  # setting timeout for create and delete operations
  timeouts {
    create = "5m"
    delete = "2h"
  }
}