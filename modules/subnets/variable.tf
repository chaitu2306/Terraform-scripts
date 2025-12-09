# variables for public subnet

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

# variables for private subnet

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

variable "vpc_id" {
    description = "The VPC ID where subnets will be created"
}
