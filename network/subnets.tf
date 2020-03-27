resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet
  map_public_ip_on_launch = "true"
  tags = {
    Owner = "valinor"
    Env  = var.env
    Tier: "public"
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

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet
  availability_zone       = "us-west-2a"
  tags = {
    Owner = "valinor"
    Env  = var.env
    Tier: "private"
  }
}