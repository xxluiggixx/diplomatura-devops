resource "aws_key_pair" "pin" {
  key_name   = "pin"
  public_key = file("pin.pub")
}

resource "aws_instance" "dove_inst" {
  ami                    = ami-0e001c9271cf7f3b9
  instance_type          = "t2.micro"
  availability_zone      = var.zone
  key_name               = aws_key_pair.pin.key_name
  vpc_security_group_ids = ["sg-0deec4d9fb7615516"]
  tags = {
    Name    = "PIN-instance"
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
    user        = var.user
    private_key = file("aws")
    host        = self.public_ip
  }
}

output "public_ip" {
  value = aws_instance.dove_inst.public_ip
}
output "private_ip" {
  value = aws_instance.dove_inst.private_ip
}