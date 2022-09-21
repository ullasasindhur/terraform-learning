module "ec2_instance" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "~>4.1.4"
  name                        = "module-ec2"
  ami                         = var.ami
  associate_public_ip_address = var.associaite_public_ip
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.module_key_pair.key_name
  tags = {
    environment = local.environment
  }
}


resource "aws_key_pair" "module_key_pair" {
  public_key = var.public_key
}

locals {
  environment = "temporary"
}
