resource "aws_eip" "nat_gateway_eip" {
  vpc = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnet.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw.id
  }

  tags = {
    Name = "Main Route Table for NAT-ed subnet"
    Env = var.env
  }
}

resource "aws_route_table" "local_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Main Route Table for isolated subnet"
    Env = var.env
  }
}

resource "aws_route_table_association" "private_subnet_assoc" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "local_database_a_assoc" {
  subnet_id = aws_subnet.database_subnet_a.id
  route_table_id = aws_route_table.local_route_table.id
}

resource "aws_route_table_association" "local_database_b_assoc" {
  subnet_id = aws_subnet.database_subnet_b.id
  route_table_id = aws_route_table.local_route_table.id
}