# Assign an elastic IP to the network interface created in step 7
resource "aws_eip" "Master" {
  domain = "vpc"
}
