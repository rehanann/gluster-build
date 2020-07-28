resource "google_compute_instance" "gluster-1" {
  name = "gluster-1"
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

resource "google_compute_disk" "gluster-1" {
    name = "gluster-1-docker"
    type = "pd-ssd"
    zone = "${"${var.region}"}-a"
    size = "10"
}

resource "google_compute_attached_disk" "gluster-1" {
    disk = "${google_compute_disk.gluster-1.self_link}"
    instance = "${google_compute_instance.gluster-1.self_link}"
}

resource "google_compute_instance" "gluster-2" {
  name = "gluster-2"
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

resource "google_compute_disk" "gluster-2" {
    name = "gluster-2-docker"
    type = "pd-ssd"
    zone = "${"${var.region}"}-a"
    size = "10"
}

resource "google_compute_attached_disk" "gluster-2" {
    disk = "${google_compute_disk.gluster-2.self_link}"
    instance = "${google_compute_instance.gluster-2.self_link}"
}

resource "google_compute_instance" "gluster-3" {
  name = "gluster-3"
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

resource "google_compute_disk" "gluster-3" {
    name = "gluster-3-docker"
    type = "pd-ssd"
    zone = "${"${var.region}"}-a"
    size = "10"
}

resource "google_compute_attached_disk" "gluster-3" {
    disk = "${google_compute_disk.gluster-3.self_link}"
    instance = "${google_compute_instance.gluster-3.self_link}"
}