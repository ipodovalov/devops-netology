resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
  description = "vpc description"

  labels = var.labels
}
resource "yandex_vpc_subnet" "develop" {
  for_each = var.subnets

  name           = each.key
  zone           = each.value.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [each.value.cidr]
  description    = "vpc description"

  labels = var.labels
}
