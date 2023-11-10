variable "region" {
  default = "us-east-2"
}

variable "security_groups_id" {
  default = "sg-02de233884d510e36"
}

variable "instance-ami" {
  default = "ami-0931978297f275f71"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_count" {
  default = "1"
}

variable "ssh_key" {
  default = "web-key.pem"
}

variable "key_name" {
  default = "web-key"
}

variable "aws_key_pair" {
  default = ""
  type    = string
}

variable "aws_private_pair" {
  default = ""
  type    = string
}
