
# Creting VPC resource named "chaitu_vpc"

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "chaitu_vpc"
    }
}

# Creating public subnet

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "chaitu_public_subnet"
    }
}

# Creating private subnet

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    tags = {
        Name = "chaitu_private_subnet"
    }
}

# Creating internet gateway for the vpc

resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "chaitu_ig"
    }
}

# Creating public route table and routing to internet gateway 

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

# Associating public subnet to the public route table

resource "aws_route_table_association" "ass_public" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.rt1.id
}

# Creating elastic_ip for the nat_gateway 

resource "aws_eip" "eip" {
  tags = {
    Name = "nat-gw-eip"
  }
}

# Creating nat_gateway and allocating ellastic_ip to it

resource "aws_nat_gateway" "ng" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "main-nat-ng"
  }
}

# Creating private route table and routing to nat gateway 

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

# Associating private subnet to the private route table

resource "aws_route_table_association" "ass_private" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.rt2.id
}

# Creating security group and adding inbound_rules(22, 8080) & outbound_rules(All Traffic)

resource "aws_security_group" "sg" {
    name = "chaitu-sg-id"
    description = "Allow TLS inbound traffic and all outbound traffic"
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "chaitu-sg"
    }
    ingress {
        from_port = 22
        to_port =22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"                         # "-1" means All Traffic 
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}

# Creating key pair before we create a key pair we have to create a key in local by these below command and assign to the aws key pair with required name 
# ssh-keygen -t rsa -b 4098n-f chaitu-key

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"  
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQNU9PugbWfkyNNLv6QHoe3417bGuIo7maOSqzoT97ZZSn2+u8TRfwAZt6zBXgPjHSK/a91ZxjIC3ms0v6IUVL+rB+GG90a5lO4AWDo1Rr/1XrwbaN1RqfogIHi/udGONZ1H5AUIl+AT3TA0T7qHaM+dPJilPgk1Ug5sMO5ZEMdHog91U2rM4ei7INIPGwvoMhSAwYSjrVkldJLrQcWX4Kylghi1E63RBbZgdxEYrtCTxacuIksBshoX2l1+2SIHGJqvlZNwL0XRmxSXqZdTJYu6jHH3WyZOm5NoNdAG5cGrSe1OgrOsz7DrKoO6ryM4cjETzbjTVC+8jqtT3Bm0POSDxJoTstHmhEF0KuJ9hIMIJ2SN22twwfdNK+mltp/S6RMw8r5A/pfmQpP1n0Z9ciS9H/NsgxoPC0aK1di99o0IAVpt09dUn9oQoYqq9n1CBGUuCRLxmRyVZ86p9JJF3q6RFMUqwIbRWZl5YAwA6CCUy7NHXkSPFh2j4ANPruijXlgkhDqMEa1op/iB2ztmqAq5/FVfeEaCrZkl0zr6gIPXZp0usoLcil23x3s+wJPiAogTZKcvFIq0BYrSSbHlYzudKgQ1ngX8ynt2vrhVPBWMunEUIXF68wbct82TIcZpD23golS6LE3MTJ7wcFBL44K3qypDT4tP76CMm9018/7EFQ== chait@Chaitu"
   # this is the public key which we created
}

# Creating public ec2 instance using AMI, security group, public_subnet, key_pair, and with enabling associate_public_ip_address
# We get AMI image from AWS -> EC2 -> AMI catalog in this we have to pick the required OS

resource "aws_instance" "web" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  subnet_id = aws_subnet.public_subnet.id
  key_name = "deployer-key"
  associate_public_ip_address =true
  tags = {
    Name = "chaitu-pub-ins"
  }
}

# Creating private ec2 instance using AMI, security group, private_subnet, key_pair, and with disabling associate_public_ip_address
# We get AMI image from AWS -> EC2 -> AMI catalog in this we have to pick the required OS

resource "aws_instance" "private_web" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    subnet_id = aws_subnet.private_subnet.id
    key_name = "deployer-key"
    associate_public_ip_address = false
    tags = {
        Name = "chaitu-pvt-ins"
    }
}

