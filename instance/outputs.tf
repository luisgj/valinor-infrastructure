output "ip_address" {
  value = aws_instance.bastion.public_ip
}

output "dns" {
  value = aws_instance.bastion.public_dns
}

output "private_ip_address" {
  value = aws_instance.private.private_ip
}