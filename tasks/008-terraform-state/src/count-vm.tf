resource "yandex_compute_instance" "web_server" {
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
  metadata = local.ssh_keys_and_serial_port

}
