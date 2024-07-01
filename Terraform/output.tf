output "public_ip" {
  value = aws_instance.mundose_bastion_inst.public_ip
}
output "private_ip" {
  value = aws_instance.mundose_bastion_inst.private_ip
}