locals {
  virtual_machines = {
    "vm1" = { vm_name = "main", vm_cpu=2, vm_ram=1, vm_disk_size=10, vm_core_fraction=5 },
    "vm2" = { vm_name = "replica", vm_cpu=2, vm_ram=1, vm_disk_size=15, vm_core_fraction=20 }
  }
}

resource "yandex_compute_instance" "servers" {

  for_each = local.virtual_machines

  name        = each.value.vm_name
  platform_id = "standard-v1"
  resources {
    cores         = each.value.vm_cpu
    memory        = each.value.vm_ram
    core_fraction = each.value.vm_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.os_image.image_id
      size = each.value.vm_disk_size
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

  depends_on = [
    yandex_compute_instance.web_server
  ]

}
