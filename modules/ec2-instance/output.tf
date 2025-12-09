output "public_instance_ids" {
    description = "this is the public instance id"
    value = aws_instance.public.*.id
}

output "private_instance_ids" {
    description = "this is the private instance id"
    value = aws_instance.private.*.id
}