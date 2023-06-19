output "vpc_id" {
  description = "vpc_id"
  value       = yandex_vpc_network.develop.id
}

output "subnets_locations" {
  description = "subnets_locations"
  value       = zipmap(values(yandex_vpc_subnet.develop)[*].name, values(yandex_vpc_subnet.develop)[*].id)
}
