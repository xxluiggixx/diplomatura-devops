
#resource "aws_key_pair" "pin" {
#  key_name   = "pin"
#  public_key = file("./Resources/pin.pub")
#}

resource "aws_iam_instance_profile" "ec2-admin" {
  name = "ec2-admin"
  role = "${aws_iam_role.ec2_admin.name}"
}

resource "aws_instance" "mundose_bastion_inst" {
  ami                    = var.aws_image
  instance_type          = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.ec2-admin.name}"
  availability_zone      = var.zone
  key_name               = "PIN"
  vpc_security_group_ids = ["sg-0f9a28401f311c339"]
  tags = {
    Name    = "PIN-Bastion-instance"
  }

  provisioner "file" {
    source      = "./Resources/"
    destination = "/tmp/"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/ec2_user_data.sh && sudo /tmp/ec2_user_data.sh",
      "chmod u+x /tmp/eksctl.sh && sudo /tmp/eksctl.sh",
      "echo 'Empezar otro script'"
    ]
  }
  connection {
    user        = var.user
    private_key = file("./Resources/PIN.pem")
    host        = self.public_ip
  }
}
