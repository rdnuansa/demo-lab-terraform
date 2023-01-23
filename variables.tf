variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami_id" {
  type    = string
  default = "ami-0778521d914d23bc1"
}

variable "instance_type" {
  type    = string
  default = "t1.micro"
}

variable "public_key" {
  type        = string
  description = "SSH Pub Key to access instance"
}