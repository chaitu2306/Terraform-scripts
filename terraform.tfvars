# vpc values

vpc_cidr_block = "10.0.0.0/16"
vpc_tag = "chaitu_vpc"
vpc_tenancy = "default"

# public subnet values

public_subnet_cidr_block = "10.0.1.0/24"
public_subnet_tag = "chaitu_public_subnet"
public_availability_zone = "us-east-1a"

# private subnet values

private_subnet_cidr_block = "10.0.2.0/24"
private_subnet_tag = "chaitu_private_subnet"
private_availability_zone = "us-east-1b"

# internet gateway values

internet_gateway = "chaitu_ig"

# eip and nat gateway values

eip_tag = "nat-gw-eip"
nat_gw_tag = "main-nat-ng"

# key pair values

key_name1   = "deployer-key"  
public_key1 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQNU9PugbWfkyNNLv6QHoe3417bGuIo7maOSqzoT97ZZSn2+u8TRfwAZt6zBXgPjHSK/a91ZxjIC3ms0v6IUVL+rB+GG90a5lO4AWDo1Rr/1XrwbaN1RqfogIHi/udGONZ1H5AUIl+AT3TA0T7qHaM+dPJilPgk1Ug5sMO5ZEMdHog91U2rM4ei7INIPGwvoMhSAwYSjrVkldJLrQcWX4Kylghi1E63RBbZgdxEYrtCTxacuIksBshoX2l1+2SIHGJqvlZNwL0XRmxSXqZdTJYu6jHH3WyZOm5NoNdAG5cGrSe1OgrOsz7DrKoO6ryM4cjETzbjTVC+8jqtT3Bm0POSDxJoTstHmhEF0KuJ9hIMIJ2SN22twwfdNK+mltp/S6RMw8r5A/pfmQpP1n0Z9ciS9H/NsgxoPC0aK1di99o0IAVpt09dUn9oQoYqq9n1CBGUuCRLxmRyVZ86p9JJF3q6RFMUqwIbRWZl5YAwA6CCUy7NHXkSPFh2j4ANPruijXlgkhDqMEa1op/iB2ztmqAq5/FVfeEaCrZkl0zr6gIPXZp0usoLcil23x3s+wJPiAogTZKcvFIq0BYrSSbHlYzudKgQ1ngX8ynt2vrhVPBWMunEUIXF68wbct82TIcZpD23golS6LE3MTJ7wcFBL44K3qypDT4tP76CMm9018/7EFQ== chait@Chaitu"

# route table values

public_rt_tag = "chaitu_public_rt"
public_rt_cidr = "0.0.0.0/0"

# private route table values

private_rt_tag = "chaitu_private_rt"
private_rt_cidr = "0.0.0.0/0"

# name of security group value

security_group_tag = "chaitu-sg"

# public instance values

public_instance_ami = "ami-0ecb62995f68bb549"
public_instance_type = "t3.micro"
public_instance_count = 1
public_instance_name = "chaitu-pub-ins"
public_associate_public_ip_address = true

# private instance values

private_instance_name = "chaitu_pvt_ins"
private_instance_count = 1
private_instance_type = "t3.medium"
private_instance_ami = "ami-0ecb62995f68bb549"
private_associate_private_ip_address = false