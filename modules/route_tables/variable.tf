# public route table variables

variable "public_rt_tag" {
    description = "the name for route table"
    type = string
}
variable "public_rt_cidr" {
    description = "the cidr for public route table"
    type = string
}

# private route table variables

variable "private_rt_tag" {
    description = "the name for private route table"
    type = string
}
variable "private_rt_cidr" {
    description = "the cidr for privte rt"
    type = string
}

variable "vpc_id" {
    type        = string
    description = "VPC ID from vpc module"
}

variable "public_subnet_id" {
    type = string
    description = "this is the public subnet id"
}

variable "private_subnet_id" {
    type = string
    description = "this is the private subnet id"
}

variable "nat_gateway_id" {
    description = "this is nat gateway id"
    type = string
}

variable "gateway_id" {
    description = "this is internet gateway id"
    type = string
}