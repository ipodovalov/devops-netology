data "yandex_compute_image" "c7-image" {
  family = "centos-7"
}

resource "yandex_compute_instance" "node01" {
  name                      = "node01"
  zone                      = "ru-central1-b"
  hostname                  = "node01.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.c7-image.id
      name        = "root-node01"
      type        = "network-hdd"
      size        = "50"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.default.id}"
    nat       = true
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}
