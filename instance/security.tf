resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key-test"
  public_key = var.public_key
}