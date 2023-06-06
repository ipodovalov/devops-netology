output "vpc_static_ips" {
  value = {
    "${yandex_compute_instance.platform-db.name}" = "${yandex_compute_instance.platform-db.network_interface[0].nat_ip_address}"
    "${yandex_compute_instance.platform-web.name}" ="${yandex_compute_instance.platform-web.network_interface[0].nat_ip_address}"
  }
  description = "VPC static ip addresses"
  sensitive = false
}
