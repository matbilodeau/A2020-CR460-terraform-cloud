resource "google_compute_instance" "serveurweb1" {
  name         = "serveurweb1"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["serveur-web"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.demo-dmz.name
    access_config {

    }
  }
  metadata_startup_script = "apt-get -y update && apt-get -y upgrade && apt-get -y install apache2 && systemctl start apache2"
}
