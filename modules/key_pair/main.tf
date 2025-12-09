resource "aws_key_pair" "deployer" {
  key_name   = var.key_name1
  public_key = var.public_key1
   # this is the public key which we created
}