resource "null_resource" "manifest_config_files" {
  connection {
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    # private_key    = var.ssh_private_pair
    # host        = self.public_ip
    host  = aws_instance.web-app[0].public_ip
    port  = 22
    agent = false
    type  = "ssh"
  }

  provisioner "remote-exec" {
    inline = [
      #   "sudo yum -y update",
      "sudo yum -y install httpd git",
    ]
  }

  provisioner "file" {
    source      = "files/Ecommerce" # terraform machine
    destination = "/var/www/html"   # remote machine
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
    ]
  }
}

# ### https://github.com/learning-zone/website-templates.git
