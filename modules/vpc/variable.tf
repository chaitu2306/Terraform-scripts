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