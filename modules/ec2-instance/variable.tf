# VPC security group
variable "vpc_security_group_id" {
  description = "The security group ID to attach to EC2 instances"
  type        = string
}

# Key pair
variable "key_pair_name" {
  description = "The name of the key pair"
  type        = string
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

variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID for the public EC2 instance"
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

variable "private_subnet_id" {
  type        = string
  description = "Private subnet ID for the private EC2 instance"
}
