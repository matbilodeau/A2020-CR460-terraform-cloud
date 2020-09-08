provider "google" {
  project = var.project_id
  region  = "us-east1"
  zone    = var.zone
}

terraform {
   backend "remote" {
     # The name of your Terraform Cloud organization.
     organization = "A2020-CR460"
     # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "A2020-CR460-terraform-cloud"
    }
  }
}

resource "google_compute_instance" "tfc-exemple" {
  name         = "tfc-exemple"
  machine_type = "f1-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network       = "default"
    access_config {

    }
  }

}
