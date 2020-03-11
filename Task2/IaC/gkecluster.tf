resource "google_container_cluster" "mypyapp-gke" {
  name ="mypyapp-gkecluster"
  network = "default"
  location = var.ZONE 
  remove_default_node_pool = true
  initial_node_count = 1

}

resource "google_container_node_pool" "node_pool"{

  name ="mypyapp-node-pool"
  location = "us-central1-a"
  cluster = google_container_cluster.mypyapp-gke.name
  node_count = 1 
  
  node_config {
  machine_type = "n1-standard-1"
  }
}
