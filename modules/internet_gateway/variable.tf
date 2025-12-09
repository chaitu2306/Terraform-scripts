variable "internet_gateway" {
    description = "the igw for internet access"
    type = string
}
variable "vpc_id" {
  type        = string
  description = "The VPC ID where subnets will be created"
}