output "ip_address" {
  value = aws_instance.the_instance.public_ip
}

output "dns" {
  value = aws_instance.the_instance.public_dns
}