#Output
output "Master" {
  value = "ssh -i ~/${var.key_pair}.pem ubuntu@${aws_eip.Master.public_ip}"
}
