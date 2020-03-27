resource "aws_instance" "private" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = [var.private_security_group]
  tags = {
    "Env"      = "test"
  }
}