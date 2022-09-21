module "ec2" {
  source     = "./modules/ec2"
  public_key = var.public_key
}


