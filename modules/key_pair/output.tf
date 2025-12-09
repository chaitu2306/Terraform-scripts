output "key_pair_id" {
    description = "this is the output for key name"
    value = aws_key_pair.deployer.id
}

output "key_pair_name" {
  description = "The name of the key pair"
  value       = aws_key_pair.deployer.key_name
}
