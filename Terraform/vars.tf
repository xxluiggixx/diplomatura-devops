variable "region" {
  default = "us-east-1"
}

variable "zone" {
  default = "us-east-1a"
}

variable "aws_image" {
    type = string
    default = "ami-0e001c9271cf7f3b9"
    description = "The id of the machine image (AMI) to use for the server."
}

variable "user" {
  default = "ubuntu"
}

variable "pub_key_name" {
  default = "pin"
}