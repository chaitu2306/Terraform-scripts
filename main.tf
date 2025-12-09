module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_tag = var.vpc_tag
  vpc_tenancy = var.vpc_tenancy
}


# call subnet module

module "subnet" {
  source = "./modules/subnets"

  vpc_id = module.vpc.vpc_id
  public_subnet_cidr_block = var.public_subnet_cidr_block
  public_availability_zone = var.public_availability_zone
  public_subnet_tag = var.public_subnet_tag

  private_subnet_tag = var.private_subnet_tag
  private_subnet_cidr_block = var.private_subnet_cidr_block
  private_availability_zone = var.private_availability_zone
}

module "internet_gateway" {
  source = "./modules/internet_gateway"

  vpc_id            = module.vpc.vpc_id
  internet_gateway  = var.internet_gateway
}

module "nat_gateway" {
  source = "./modules/nat_gateway"

  public_subnet_id = module.subnet.public_subnet_id
  eip_tag          = var.eip_tag
  nat_gw_tag       = var.nat_gw_tag
}

module "key_pair" {
  source       = "./modules/key_pair"
  key_name1 = var.key_name1
  public_key1    = var.public_key1
}

module "route_tables" {
  source = "./modules/route_tables"

  vpc_id           = module.vpc.vpc_id
  gateway_id       = module.internet_gateway.gateway_id
  nat_gateway_id   = module.nat_gateway.nat_gateway_id
  public_subnet_id = module.subnet.public_subnet_id
  private_subnet_id = module.subnet.private_subnet_id

  public_rt_tag    = var.public_rt_tag
  public_rt_cidr   = var.public_rt_cidr
  private_rt_tag   = var.private_rt_tag
  private_rt_cidr  = var.private_rt_cidr
}

module "security_groups" {
  source              = "./modules/security_groups"
  vpc_id              = module.vpc.vpc_id
  security_group_tag   = var.security_group_tag
}

module "ec2_instance" {
  source = "./modules/ec2-instance"

  vpc_security_group_id            = module.security_groups.vpc_security_group_id
  key_pair_name                    = module.key_pair.key_pair_name

  # Public instance variables
  public_instance_ami              = var.public_instance_ami
  public_instance_type             = var.public_instance_type
  public_instance_count            = var.public_instance_count
  public_associate_public_ip_address = var.public_associate_public_ip_address
  public_instance_name             = var.public_instance_name
  public_subnet_id                 = module.subnet.public_subnet_id

  # Private instance variables
  private_instance_ami             = var.private_instance_ami
  private_instance_type            = var.private_instance_type
  private_instance_count           = var.private_instance_count
  private_associate_private_ip_address = var.private_associate_private_ip_address
  private_instance_name            = var.private_instance_name
  private_subnet_id                = module.subnet.private_subnet_id
}
