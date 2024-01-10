resource "aws_key_pair" "ssh_key" {
  key_name = "deployer-key"
  #public_key = var.aws_key_pair
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAJ7M38wDPnT8Wkd1ZbHEfmbg+DOF/LOQ0KzLlB5oHHKLWRPnRVYxf3hEyVMxK33GLj+XNw3woAHsO2cPN+RiCQ1Wa/NxoZGoJn57nj8H8j/18TW7dfD5+8GUND04AVb8AGa6t2yS55UUtaDK+tGUhNnUUPJBwUzfxLX01NcqRgyy/DOW+wL6h6ginuJJK2A+HtEYEFNjlqQmQ5NAiskfr9b0l456ZK3k/9ELq0O3trqBuHrbPlr8RqtRKgblqMB7mLlxy9oqLF/4/4ZNCuYsR5/pk1RZuSBhHGODamRR3E3L1uHlZLsaZxwQxMOysKG2og8YLnlFmOZKpQoxx3Ts6DIRpw8XitJlDDZSNjkx++pn/BOpXY7/fn/9xpanog7wfMp2YvuJ1B5L7+oaQgfn/GzoGqXk/yhO4JHs3IFlIaHzRlUncVjitxvUM6g7jaACpTVNZlb9zParvgwCuYwrFinGUR50uoCQNpyGPc2gkyliHN3uxmN7PZV7yH26B+pc= swilliams@MDLT002"
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
