resource "google_compute_network" "reseaudemo" {
  name                    = "reseaudemo"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "demo-dmz" {
  name          = "demo-dmz"
  ip_cidr_range = "172.16.25.0/24"
  region        = var.region
  network       = google_compute_network.reseaudemo.self_link
}

resource "google_compute_firewall" "web-http-s" {
  name    = "web-http-s"
  network = google_compute_network.reseaudemo.name
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  target_tags=["serveur-web"]
}
