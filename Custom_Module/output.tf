output "security_group_id" {
  value = module.ec2.security_group_id
}

output "instance_ip" {
  value = module.ec2.ec2_ip
}
