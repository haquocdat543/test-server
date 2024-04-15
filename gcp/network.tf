resource "google_compute_network" "vpc_network" {
  name = "vpc-network-${terraform.workspace}"
  auto_create_subnetworks = true
}
