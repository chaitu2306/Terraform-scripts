# Creating public route table and routing to internet gateway 

resource "aws_route_table" "rt1" {
    vpc_id = var.vpc_id
    route {
        cidr_block = var.public_rt_cidr
        gateway_id = var.gateway_id
    }
    tags = {
        Name = var.public_rt_tag
    }
}

# Associating public subnet to the public route table

resource "aws_route_table_association" "ass_public" {
    subnet_id = var.public_subnet_id
    route_table_id = aws_route_table.rt1.id
}

# Creating private route table and routing to nat gateway 

resource "aws_route_table" "rt2" {
    vpc_id = var.vpc_id
    route {
        cidr_block = var.private_rt_cidr
        nat_gateway_id = var.nat_gateway_id
    }
    tags = {
        Name = var.private_rt_tag
    }
}

# Associating private subnet to the private route table

resource "aws_route_table_association" "ass_private" {
    subnet_id = var.private_subnet_id
    route_table_id = aws_route_table.rt2.id
}