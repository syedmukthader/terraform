resource "aws_instance" "test2-teraform" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "terra1"
  vpc_security_group_ids = ["sg-0ec3f9ae92a8a2b11"]
  tags                   = {
    Name    = "test2-teraform"
    Project = "Terra"
  }
}