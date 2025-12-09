output "public_rt_id" {
    description = "this is public route id"
    value = aws_route_table.rt1.id
}

output "private_rt_id" {
    description = "this is private route id"
    value = aws_route_table.rt2.id
}