

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "chaitu_vpc"
    }
}


resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "chaitu_public_subnet"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    tags = {
        Name = "chaitu_private_subnet"
    }
}

resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "chaitu_ig"
    }
}

resource "aws_route_table" "rt1" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ig.id
    }
    tags = {
        Name = "chaitu_public_rt"
    }
}

resource "aws_route_table_association" "ass_public" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.rt1.id
}

resource "aws_route_table" "rt2" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ng.id
    }
    tags = {
        Name = "chaitu_private_rt"
    }
}

resource "aws_eip" "eip" {
  tags = {
    Name = "nat-gw-eip"
  }
}

resource "aws_nat_gateway" "ng" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "main-nat-ng"
  }
}

resource "aws_route_table_association" "ass_private" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.rt2.id
}