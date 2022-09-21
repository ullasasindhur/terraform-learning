resource "aws_security_group" "custom_ec2" {
  name        = var.sg_name
  description = "Custom security group for ec2 instances launcher with custom module"
  dynamic "ingress" {
    for_each = local.ingress
    content {
      from_port        = ingress.value.port
      to_port          = ingress.value.port
      protocol         = ingress.value.protocol
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    environment = local.environment
  }
}

resource "aws_instance" "temp_node" {
  ami                  = var.ami_id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  instance_type        = "t2.micro"
  key_name             = aws_key_pair.ec2_key.key_name
  security_groups      = ["custom-ec2"]
  tags = {
    environemnt = local.environment
  }
  depends_on = [
    aws_security_group.custom_ec2
  ]
}

resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = var.public_key
  tags = {
    "environment" = local.environment
  }
}


resource "aws_iam_role" "temp_role" {
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "sts:AssumeRole"
          ],
          "Principal" : {
            "Service" : [
              "ec2.amazonaws.com"
            ]
          }
        }
      ]
    }
  )
  description = "Role to access the aws s3 resource"
  name        = "ec2-s3-role"
  tags = {
    "environment" = local.environment
  }
}

data "aws_iam_policy" "s3_policy" {
  name = var.policy_name
}

resource "aws_iam_policy_attachment" "policy_attach" {
  name       = var.policy_attachment_name
  roles      = [aws_iam_role.temp_role.name]
  policy_arn = data.aws_iam_policy.s3_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.temp_role.name
  depends_on = [
    aws_iam_policy_attachment.policy_attach
  ]
}

locals {
  environment = "temporary"
}

locals {
  ingress = [{
    port     = "22",
    protocol = "tcp"
    },
    {
      port     = "80",
      protocol = "tcp"
  }]
}
