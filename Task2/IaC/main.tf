resource "google_compute_address" "static" {
  name = var.ip_name 
}

data "google_compute_image" "debian_image" {
  family  = "centos-8"
  project = "centos-cloud"
}

resource "google_compute_instance" "instance_with_ip" {
  name         = "vm-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
}

