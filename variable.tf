variable "vpc_tag" {
    description = "the name for vpc"
    type = string
}
variable "vpc_cidr_block" {
    description = "the cidr block for vpc"
    type = string
}
variable "vpc_tenancy" {
    description = "the instance tenancy for vpc"
    type = string
}

variable "public_subnet_tag" {
    description = "the name for the public subnet"
    type = string
}
variable "public_subnet_cidr_block" {
    description = "the cidr block for public subnet"
    type = string
}
variable "public_availability_zone" {
    description = "the availability zone for subnet"
    type = string
}

variable "private_subnet_tag" {
    description = "the subnet name for private subnet"
    type = string
}
variable "private_subnet_cidr_block" {
    description = "the cidr block for private subnet"
    type = string
}
variable "private_availability_zone" {
    description = "the availability zone for private subnet"
    type = string
}

variable "internet_gateway" {
    description = "the igw for internet access"
    type = string
}

variable "nat_gw_tag" {
    description = "the tag name for nat gateway"
    type = string
}
variable "eip_tag" {
    description = "the tag name for nat gateway"
    type = string
}

variable "key_name1" {
    type = string
    description = "this is the variable name for key pair"
}
variable "public_key1" {
    type = string
    description = "this is the variable name for the public key"
}

variable "public_rt_tag" {
    description = "the name for route table"
    type = string
}
variable "public_rt_cidr" {
    description = "the cidr for public route table"
    type = string
}
variable "private_rt_tag" {
    description = "the name for private route table"
    type = string
}
variable "private_rt_cidr" {
    description = "the cidr for privte rt"
    type = string
}

variable "security_group_tag" {
    type = string
    description = "this is tag for security group chaitu-sg"
}

# Public instance variables

variable "public_instance_ami" {
  type        = string
  description = "AMI ID for the public EC2 instance"
}

variable "public_instance_type" {
  type        = string
  description = "Instance type for the public EC2 instance"
}

variable "public_instance_count" {
  type        = number
  description = "Number of public EC2 instances to create"
}

variable "public_associate_public_ip_address" {
  type        = bool
  description = "Whether to associate public IP with public EC2 instance"
}

variable "public_instance_name" {
  type        = string
  description = "Tag name for public EC2 instance"
}

# Private instance variables

variable "private_instance_ami" {
  type        = string
  description = "AMI ID for the private EC2 instance"
}

variable "private_instance_type" {
  type        = string
  description = "Instance type for the private EC2 instance"
}

variable "private_instance_count" {
  type        = number
  description = "Number of private EC2 instances to create"
}

variable "private_associate_private_ip_address" {
  type        = bool
  description = "Whether to associate public IP with private EC2 instance"
}

variable "private_instance_name" {
  type        = string
  description = "Tag name for private EC2 instance"
}
