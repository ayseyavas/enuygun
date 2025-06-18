resource "google_container_node_pool" "main_pool" {
  name       = "main-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.zone
  initial_node_count = 1

  node_config {
    machine_type  = "e2-standard-2"
    disk_type     = "pd-standard"
    disk_size_gb  = 50
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

resource "google_container_node_pool" "application_pool" {
  name     = "application-pool"
  cluster  = google_container_cluster.primary.name
  location = var.zone

  node_config {
    machine_type  = "e2-standard-2"
    disk_type     = "pd-standard"
    disk_size_gb  = 50
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }

  depends_on = [google_container_cluster.primary]
}

