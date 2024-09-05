resource "aws_instance" "myAnsibleInstance" {
      ami  = var.ami_id
      key_name = var.key_name
      instance_type = "t2.micro"
      vpc_security_group_ids = [aws_security_group.ansible-sg-24.id]
      tags= {
        Name = "Ansible_instance"
      }
    }

 resource "aws_security_group" "ansible-sg-24" {
      name        = "security_ansible_group"
      description = "security group for Sonar"

      ingress {
        from_port   = 9000
        to_port     = 9000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

     ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

     # outbound from Sonar server
      egress {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

      tags= {
        Name = "security_ansible"
      }
    }

# Create Elastic IP address for Sonar instance
resource "aws_eip" "myAnsibleInstance" {
  vpc      = true
  instance = aws_instance.myAnsibleInstance.id
tags= {
    Name = "ansible_elastic_ip"
  }
}
