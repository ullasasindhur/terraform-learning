resource "aws_s3_bucket" "bucket" {
  bucket = "mybucket-${terraform.workspace}"
  tags = {
    Name        = "bucket-${terraform.workspace}"
    environment = "temporary"
  }
}
