variable "instance_type" {
  type = map(string)
  default = {
    prod-stage    = "t2.micro"
    develop-stage = "t1.micro"
    default       = "t2.micro"
  }
}
