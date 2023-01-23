resource "aws_vpc" "lab-vpc" {
  cidr_block = "10.32.0.0/16"

  tags = {
    Name = "lab-vpc"
  }
}

resource "aws_internet_gateway" "lab-igw" {
  vpc_id = aws_vpc.lab-vpc.id

  tags = {
    Name = "lab-igw"
  }
}

resource "aws_route_table" "lab-rt" {
  vpc_id = aws_vpc.lab-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab-igw.id
  }

  tags = {
    Name = "lab-rt"
  }
}

resource "aws_route_table_association" "lab-rt-subnet-1" {
  subnet_id      = aws_subnet.lab-vpc-subnet-1.id
  route_table_id = aws_route_table.lab-rt.id
}

resource "aws_route_table_association" "lab-rt-subnet-2" {
  subnet_id      = aws_subnet.lab-vpc-subnet-2.id
  route_table_id = aws_route_table.lab-rt.id
}

resource "aws_subnet" "lab-vpc-subnet-1" {
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = "10.32.0.0/24"

  tags = {
    Name = "lab-vpc-subnet-1"
  }
}

resource "aws_subnet" "lab-vpc-subnet-2" {
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = "10.32.1.0/24"

  tags = {
    Name = "lab-vpc-subnet-2"
  }
}

