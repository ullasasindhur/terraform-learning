resource "aws_instance" "ec2" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  tags = {
    Name        = "ec2-${terraform.workspace}"
    environment = "temporary"
  }
}
