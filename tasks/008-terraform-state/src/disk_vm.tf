resource "yandex_compute_disk" "empty_disk" {
  count      = 3
  name       = "empty-disk-${count.index+1}"
  type       = "network-hdd"
  zone       = var.default_zone
  size       = 1
  block_size = 4096
}

resource "yandex_compute_instance" "disk-vm" {

  depends_on = [yandex_compute_disk.empty_disk]

  name        = "netology-disk-vm"
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

  dynamic "secondary_disk" {
    for_each = toset(yandex_compute_disk.empty_disk[*].id)
    content {
      disk_id     = secondary_disk.key
      auto_delete = true
    }
  }

  metadata = local.ssh_keys_and_serial_port

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true

}
