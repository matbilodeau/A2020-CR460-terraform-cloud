output "instance_address" {
  value = google_compute_instance.tfc-exemple.network_interface.0.access_config.0.nat_ip
}
