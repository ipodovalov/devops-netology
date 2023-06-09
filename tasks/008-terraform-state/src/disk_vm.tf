resource "yandex_compute_disk" "empty-disk" {
  count      = 3
  name       = "empty-disk-${count.index+1}"
  type       = "network-hdd"
  zone       = var.default_zone
  size       = 1
  block_size = 4096
}
