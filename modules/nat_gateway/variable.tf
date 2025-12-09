variable "nat_gw_tag" {
    description = "the tag name for nat gateway"
    type = string
}

variable "eip_tag" {
    description = "the tag name for nat gateway"
    type = string
}

variable "public_subnet_id" {
  type = string
  description = "this is the public subnet id"
}
