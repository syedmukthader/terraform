resource "aws_key_pair" "terra-key" {
  key_name   = "terrakey"
  public_key = file("terraform.pub")
}
resource "aws_instance" "test4-teraform" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.terra-key.key_name
  vpc_security_group_ids = ["sg-0ec3f9ae92a8a2b11"]
  tags = {
    Name    = "test3-teraform"
    Project = "Terra"
  }
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
  connection {
    user        = var.USER
    private_key = file("terraform")
    host        = self.public_ip
  }
}

output "PublicIP" {
  value = aws_instance.test4-teraform.public_ip
}
output "PrivateIP" {
  value = aws_instance.test4-teraform.private_ip
}