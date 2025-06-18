resource "google_container_cluster" "primary" {
  name                     = "enuygun-case-cluster"
  location                 = var.zone  # Zonal cluster
  remove_default_node_pool = true
  initial_node_count = 1

  logging_service    = "none"
  monitoring_service = "none"

  network    = var.network
  subnetwork = var.subnetwork
}

