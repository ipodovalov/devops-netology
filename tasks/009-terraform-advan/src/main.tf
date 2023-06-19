terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

# создаем облачную сеть и подсеть
module "vpc" {
  source  = "./vpc"

  subnets = {
    public-ru-central1-a  = {
      zone = "ru-central1-a",
      cidr = "10.0.1.0/24"
    },
  }

  labels = {
    project     = "netology_test_vpc"
    environment = "test"
  }
}
