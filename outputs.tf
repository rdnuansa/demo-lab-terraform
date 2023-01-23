output "public-ip" {
  value = aws_instance.lab-vm-ssh.public_ip
}

output "private_ip-default-vm" {
  value = aws_instance.lab-vm-default-subnet.private_ip
}