# Creating security group and adding inbound_rules(22, 8080) & outbound_rules(All Traffic)

resource "aws_security_group" "sg" {
    description = "Allow TLS inbound traffic and all outbound traffic"
    vpc_id = var.vpc_id
    tags = {
        Name = var.security_group_tag
    }
    ingress {
        from_port = 22
        to_port =22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"                         # "-1" means All Traffic 
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}