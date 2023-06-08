data "yandex_compute_image" "os_image" {
  family = var.vm_minimal.image_family
}

resource "yandex_compute_instance" "web-server" {
  count       = 2
  name        = "web-${count.index + 1}"
  platform_id = "standard-v1"
  resources {
    cores         = var.vm_minimal.cores
    memory        = var.vm_minimal.memory
    core_fraction = var.vm_minimal.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.os_image.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vm_metadata.serial-port-enable
    ssh-keys           = var.vm_metadata.ssh-keys
  }

}
