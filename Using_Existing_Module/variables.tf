variable "ami" {
  default = "ami-05fa00d4c63e32376"
  type    = string
}

variable "associaite_public_ip" {
  type    = bool
  default = true
}

variable "public_key" {
  type = string
}
