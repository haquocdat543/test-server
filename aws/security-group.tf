# Create Security Group to allow port 22, 80, 443
resource "aws_security_group" "ProdSecurityGroup" {
  name        = "ProdSecurityGroup"
  description = "Allow SSH HTTP HTTPS"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Test-server-allow-all-traffics-${terraform.workspace}"
  }
}

