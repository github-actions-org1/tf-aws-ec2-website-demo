resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = var.ssh_private_pair
}

### To run locally; use the following code

# resource "aws_key_pair" "ssh_key" {
#   key_name   = "ssh_key"
#   public_key = file("~/.ssh/id_rsa.pub")
# }

resource "aws_instance" "web-app" {
  ami           = var.instance-ami
  instance_type = var.instance_type
  count         = var.ec2_count
  key_name      = aws_key_pair.ssh_key.key_name
  user_data     = file("files/install-web2.sh")
  tags = {
    Name        = "web-app-0${count.index + 1}.kendops.com"
    Environment = "Developement"
    OS          = "RedHat Linux"
    Managed     = "Developer"
  }
}

# Security group traffic rules
resource "aws_security_group_rule" "sg_ingress_public_443" {
  security_group_id = var.security_groups_id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sg_ingress_public_80" {
  security_group_id = var.security_groups_id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
