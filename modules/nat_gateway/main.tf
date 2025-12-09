# Creating elastic_ip for the nat_gateway 

resource "aws_eip" "eip" {
  tags = {
    Name = var.eip_tag
  }
}

# Creating nat_gateway and allocating ellastic_ip to it

resource "aws_nat_gateway" "ng" {
  allocation_id = aws_eip.eip.id
  subnet_id = var.public_subnet_id
  tags = {
    Name = var.nat_gw_tag
  }
}