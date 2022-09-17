provider "aws" {
  region = "us-east-1"
  # access_key = ""
  # secret_key = ""
}
resource "aws_instance" "tessst" {
  ami                    = "ami-05fa00d4c63e32376"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "terra1"
  vpc_security_group_ids = ["sg-0ec3f9ae92a8a2b11"]
  tags = {
    Name    = "Terra-test"
    Project = "Terra"
  }
}