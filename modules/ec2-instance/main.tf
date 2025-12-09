resource "aws_instance" "public" {
  ami                         = var.public_instance_ami
  instance_type               = var.public_instance_type
  count                       = var.public_instance_count
  vpc_security_group_ids      = [var.vpc_security_group_id]
  subnet_id                   = var.public_subnet_id
  key_name                    = var.key_pair_name
  associate_public_ip_address = var.public_associate_public_ip_address
  tags = {
    Name = var.public_instance_name
  }
}

# Creating private ec2 instance using AMI, security group, private_subnet, key_pair, and with disabling associate_public_ip_address
# We get AMI image from AWS -> EC2 -> AMI catalog in this we have to pick the required OS

resource "aws_instance" "private" {
    ami                         = var.private_instance_ami
    instance_type               = var.private_instance_type
    count                       = var.private_instance_count
    vpc_security_group_ids      = [var.vpc_security_group_id]
    subnet_id                   = var.private_subnet_id
    key_name                    = var.key_pair_name
    associate_public_ip_address = var.private_associate_private_ip_address
    tags = {
        Name = var.private_instance_name
    }
}
