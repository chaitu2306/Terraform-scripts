output "nat_gateway_id" {
    description = "this is nat gateway id"
    value = aws_nat_gateway.ng.id
}

output "eip_id" {
    description = "this is elastic ip id"
    value = aws_eip.eip.id
}