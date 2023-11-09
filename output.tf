output "public_ip" {
  value       = formatlist("%s: %s", aws_instance.web-app.*.public_dns, aws_instance.web-app.*.public_ip)
  description = "Public IP Address of EC2 instance"
}

output "instance_id" {
  value       = aws_instance.web-app.*.id
  description = "Instance ID"
}

output "ssh_connection" {
  value       = "ssh ec2-user@${aws_instance.web-app[0].public_ip}"
  description = "Connect via SSH"
}

output "web_connection" {
  value       = "http://${aws_instance.web-app[0].public_ip}"
  description = "Connect via SSH"
}
