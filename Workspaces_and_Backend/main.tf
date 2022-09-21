resource "aws_instance" "ec2" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = var.instance_type[terraform.workspace]
  tags = {
    Name        = "ec2"
    environment = "temporary"
  }
}
