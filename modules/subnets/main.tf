# Creating public subnet
resource "aws_subnet" "public_subnet" {
    vpc_id = var.vpc_id
    cidr_block = var.public_subnet_cidr_block
    availability_zone = var.public_availability_zone
    tags = {
        Name = var.public_subnet_tag
    }
}

# Creating private subnet

resource "aws_subnet" "private_subnet" {
    vpc_id = var.vpc_id
    cidr_block = var.private_subnet_cidr_block
    availability_zone = var.private_availability_zone
    tags = {
        Name = var.private_subnet_tag
    }
}
