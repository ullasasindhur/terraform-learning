output "security_group_id" {
  value = aws_security_group.custom_ec2.id
}

output "ec2_ip" {
  value = aws_instance.temp_node.public_ip
}
