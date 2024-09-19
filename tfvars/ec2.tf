resource "aws_security_group" "allow_ssh_terraform" {
    name        = "allow_sshh"
    description = "Allow port no 22 for ssh acess"

    egress {
       from_port        = 0
       to_port          = 0
       protocol         = "-1"
       cidr_blocks      = ["0.0.0.0/0"]
       ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
       from_port        = 22
       to_port          = 22
       protocol         = "tcp"
       cidr_blocks      = ["0.0.0.0/0"]
       ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
       Name = "allow_ssh_${var.environment}"
  }
}

resource "aws_instance" "expense" {
    for_each = var.instances
    ami = "ami-09c813fb71547fc4f"
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = merge(
       var.common_tags,
       var.tags,
       {
         Name = each.key
       }
        
      )
  }