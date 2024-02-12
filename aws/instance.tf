# Associate EIP to EC2 instances ENI
resource "aws_eip_association" "eip_assoc_to_Master" {
  instance_id   = aws_instance.Master.id
  allocation_id = aws_eip.Master.id
}

# Create Ubuntu server and install/ enable apache2
resource "aws_instance" "Master" {
  ami               = var.ami_id
  instance_type     = "t3.small"
  availability_zone = "ap-northeast-1a"
  key_name          = var.key_pair
  user_data         = file("./scripts/install.sh")

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.Master.id
  }

  tags = {
    "Name" = "Master"
  }
}
