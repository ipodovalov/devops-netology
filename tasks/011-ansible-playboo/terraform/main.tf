resource "yandex_vpc_network" "temp_network" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "temp_subnet" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.temp_network.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_compute_instance" "clickhouse-01" {
  name        = "clickhouse-01"
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
    subnet_id = yandex_vpc_subnet.temp_subnet.id
    nat       = true
  }

  metadata = local.ssh_keys_and_serial_port

  allow_stopping_for_update = true

}

resource "yandex_compute_instance" "vector-01" {
  name        = "vector-01"
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
    subnet_id = yandex_vpc_subnet.temp_subnet.id
    nat       = true
  }

  metadata = local.ssh_keys_and_serial_port

  allow_stopping_for_update = true

}
