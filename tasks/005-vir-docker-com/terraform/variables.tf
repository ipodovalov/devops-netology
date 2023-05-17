variable "yc_token" {
  default = ""
}

variable "yc_cloud_id" {
  default = "b1gtjvinm3fcamfbntlm"
}

variable "yc_folder_id" {
  default = "b1g7b5tdrrfe2e793itu"
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "centos-7-base" {
  default = "fd8j3n1l5nu9p8drk9m6"
}
