# Availability Zones
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "ubuntu_2204" {

  owners = ["099720109477"]

  filter {
    name   = "image-id"
    values = ["ami-0d28727121d5d4a3c"]
  }
}