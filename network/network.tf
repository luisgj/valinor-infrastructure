resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  tags = {
    Name = "${var.env}_vpc"
    Env  = var.env
  }
}
resource "aws_subnet" "instance_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.instance_subnet
  //map_public_ip_on_launch = "true"
  tags = {
    Name = "${var.env}_subnet"
    Env  = var.env
  }
}
resource "aws_subnet" "database_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.database_subnet
  //map_public_ip_on_launch = "true"
  tags = {
    Name = "${var.env}_subnet"
    Env  = var.env
  }
}
/*resource "aws_internet_gateway" "gw" {
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
}*/