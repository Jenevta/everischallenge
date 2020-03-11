resource "google_container_cluster" "mypyapp-gke" {
  name = var.cluster_name
  network = "default"
  location = var.location 
  remove_default_node_pool = true
  initial_node_count = var.node_count

}

resource "google_container_node_pool" "node_pool"{

  name = var.nodepool_name
  location = var.zone
  cluster = var.cluster_name 
  node_count = var.node_count 
  
  node_config {
  machine_type = var.machine_type 
  }
}

resource "google_compute_address" "ip_address" {
  name = var.ip_name 
}


