output "vpc_security_group_id" {
    description = "this is security group id"
    value = aws_security_group.sg.id
}