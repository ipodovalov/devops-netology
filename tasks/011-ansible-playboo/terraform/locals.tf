locals {
 ssh_keys_and_serial_port = {
    ssh-keys = "centos:${file("~/.ssh/id_ed25519.pub")}"
    serial-port-enable = 1
  }
}
