resource "aws_security_group" "allow_ports" {
  name        = "allow_port_tf"
  description = "This is managed by tf."

  dynamic "ingress" {
    for_each = var.ports 
    iterator = port
    content {
      description = "TLS allow from VPC side"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  tags = {
    Name = "allow_tls-tf"
  }
}


