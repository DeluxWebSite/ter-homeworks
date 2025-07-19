resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "img" {
#  family = "ubuntu-2204-lts"
  image_id = "fd8nru7hnggqhs9mkqps"
}

data "yandex_compute_image" "img2" {
#  family = "ubuntu-2204-lts"
  image_id = "fd8g64rcu9fq5kpfqls0"
}