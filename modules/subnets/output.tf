output "public_subnet_id" {
    description = "this is public subnet id"
    value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
    description = "this is private subnet id"
    value = aws_subnet.private_subnet.id
}
