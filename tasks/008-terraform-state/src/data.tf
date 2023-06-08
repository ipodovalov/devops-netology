data "yandex_compute_image" "os_image" {
  family = var.vm_minimal.image_family
}
