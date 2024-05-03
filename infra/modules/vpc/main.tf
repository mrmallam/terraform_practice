# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}

# Public Subnets
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr[0]
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true # for subnet to be assigned a public IP address
  tags = {
      Name = var.subnet_names[0]
  }
}

# Private Subnets
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr[1]
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false # don't assign a public IP address to this subnet
  tags = {
    Name = var.subnet_names[1]
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "myInternetGateway"
  }
}


# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0" # This is for the public subnet
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public-RouteTable"
  }
}

# Private Route Table - No internet access
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id
  # No route to the internet
  tags = {
    Name = "Private-RouteTable"
  }
}

# Public Route Table Association
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Private Route Table Association
resource "aws_route_table_association" "private_rta" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
