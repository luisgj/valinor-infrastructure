resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Owner = "valinor"
    Env  = var.env
  }
}

resource "aws_subnet" "instance_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.instance_subnet
  map_public_ip_on_launch = "true"
  tags = {
    Owner = "valinor"
    Env  = var.env
  }
}

resource "aws_subnet" "database_subnet_a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.database_subnet_a
  availability_zone       = "us-west-2a"
  tags = {
    Owner = "valinor"
    Env  = var.env
    Tier: "private"
  }
}

resource "aws_subnet" "database_subnet_b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.database_subnet_b
  availability_zone       = "us-west-2b"
  tags = {
    Owner = "valinor"
    Env  = var.env
    Tier: "private"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.env}_gw"
    Env  = var.env
  }
}
resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "default route table"
    env  = var.env
  }
}

resource "aws_security_group" "ssh-access" {
  name = "ssh-access-group"
  vpc_id = aws_vpc.vpc.id
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  // Terraform removes the default rule
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}