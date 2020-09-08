resource "google_compute_network" "reseau_demo" {
  name                    = "reseau_demo"
  auto_create_subnetworks = "true"
}
