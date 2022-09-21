resource "aws_instance" "ec2" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2-key.key_name
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = file("./key.pem")
  }
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx"
    ]
  }
}

resource "aws_key_pair" "ec2-key" {
  public_key = var.public_key
}
