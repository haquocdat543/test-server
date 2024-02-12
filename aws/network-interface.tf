# Create a network interface with an ip in the subnet that was created step 4
resource "aws_network_interface" "Master" {
  subnet_id       = aws_subnet.ProdSubnet.id
  private_ips     = ["10.0.0.50"]
  security_groups = [aws_security_group.ProdSecurityGroup.id]
}


