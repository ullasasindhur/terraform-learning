variable "public_key" {
  type        = string
  description = "Key pair to connect to the instance in ec2"
  sensitive   = true
}

variable "ami_id" {
  type        = string
  description = "ami id for the instance in the region"
  default     = "ami-05fa00d4c63e32376"
}

variable "policy_name" {
  type        = string
  description = "policy name that needs to be attached to ec2"
  default     = "AmazonS3FullAccess"
}

variable "sg_name" {
  type        = string
  default     = "custom-ec2"
  description = "EC2 Security Group name"
}

variable "key_name" {
  type        = string
  default     = "ec2-key"
  description = "ec2 key name pair"
}

variable "policy_attachment_name" {
  type        = string
  description = "role policy attachment name"
  default     = "atach-role-policy"
}

variable "instance_profile_name" {
  type        = string
  description = "ec2 instance profile name"
  default     = "ec2_profile"
}
