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


# Route Table
resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0" # This is for the public subnet
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "myRouteTable"
  }
}

# Route Table Association
resource "aws_route_table_association" "rta" {
    count = length(var.subnet_cidr)
    subnet_id      = aws_subnet.subnets[count.index].id
    route_table_id = aws_route_table.rt.id
}
