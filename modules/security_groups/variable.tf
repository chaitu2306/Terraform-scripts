variable "vpc_id" {
  type        = string
  description = "The VPC ID where subnets will be created"
}
variable "security_group_tag" {
    type = string
    description = "this is tag for security group chaitu-sg"
}