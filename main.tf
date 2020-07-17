resource "google_compute_instance" "master-2" {
  name = "master-2"
  machine_type = "${var.machine_type}"
  zone = "${"${var.region}"}-a"


  boot_disk {
      initialize_params {
          image = "${var.image}"
          size = "20"
      }
  }

  network_interface {
      network = "default"

      access_config { 
          // Ephemeral IP
      }
  }

  service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  metadata = {
    ssh-keys = "${var.username}:${file("${var.path}/jenkins_key")}"
    }
}

resource "google_compute_disk" "master-2" {
    name = "master-2-docker"
    type = "pd-ssd"
    zone = "${"${var.region}"}-a"
    size = "10"
}

resource "google_compute_attached_disk" "master-2" {
    disk = "${google_compute_disk.master-2.self_link}"
    instance = "${google_compute_instance.master-2.self_link}"
}

resource "google_compute_instance" "infra-2" {
  name = "infra-2"
  machine_type = "${var.machine_type}"
  zone = "${"${var.region}"}-a"


  boot_disk {
      initialize_params {
          image = "${var.image}"
          size = "20"
      }
  }

  network_interface {
      network = "default"

      access_config { 
          // Ephemeral IP
      }
  }

  service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  metadata = {
    ssh-keys = "${var.username}:${file("${var.path}/jenkins_key")}"
  }
}

resource "google_compute_disk" "infra-2" {
    name = "gluster-2-docker"
    type = "pd-ssd"
    zone = "${"${var.region}"}-a"
    size = "10"
}

resource "google_compute_attached_disk" "infra-2" {
    disk = "${google_compute_disk.infra-2.self_link}"
    instance = "${google_compute_instance.infra-2.self_link}"
}

resource "google_compute_instance" "worker-2" {
  name = "worker-2"
  machine_type = "${var.machine_type}"
  zone = "${"${var.region}"}-a"


  boot_disk {
      initialize_params {
          image = "${var.image}"
          size = "20"
      }
  }

  network_interface {
      network = "default"

      access_config { 
          // Ephemeral IP
      }
  }

  service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  metadata = {
    ssh-keys = "${var.username}:${file("${var.path}/jenkins_key")}"
  }
}

resource "google_compute_disk" "worker-2" {
    name = "worker-2-docker"
    type = "pd-ssd"
    zone = "${"${var.region}"}-a"
    size = "10"
}

resource "google_compute_attached_disk" "worker-2" {
    disk = "${google_compute_disk.worker-2.self_link}"
    instance = "${google_compute_instance.worker-2.self_link}"
}