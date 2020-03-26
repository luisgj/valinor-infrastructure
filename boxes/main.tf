data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

resource "aws_instance" "the_instance" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = var.subnet
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = [var.security_group]
  tags = {
    "Env"      = "test"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDr6xHtp7+Je7tbPG/LjwTi+CXfJMMGwM/E8QXLn2z2yc5fQv9Fy+tcaNMKF9AALFMwbQFQjwaDvjLUG/5qpBfl0hReYeX/GePKoRGvnSBSzK6R9rjDkBcWydjsEqYoK6+FaHPSMCmlI0m15Pjo4C265SYm2vjwoltrYwaC2HOV7TwZpyD7WqlCKRIAy38EkWb5iSHPqgc2FUNrP9SIe7azcpFEf1c3eDmGC1bWzveLjtCsRMtdSPU0O4oSNRtWPawts4O8MCGw7mPS6rEdtNowr0fos9b/bft55Jtue2v8PEnFLUcr7lREozJ8wYsnPcCSDHPze+rrq/UHiYeV9KiD luisgabriel@ip-192-168-30-82.us-west-2.compute.internal"
}
