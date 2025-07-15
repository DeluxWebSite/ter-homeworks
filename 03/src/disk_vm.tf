resource "yandex_compute_disk" "default" {
  count    = 3
  name     = "disk-name-${count.index}"
  size     = "8"
  type     = "network-ssd"
  zone     = var.default_zone
  image_id = data.yandex_compute_image.img.id

  labels = {
    environment = "test"
  }
}

# -----------------------------------------

resource "yandex_compute_instance" "storage" {

name = "vm-from-disks"
platform_id = var.platform_standard-v3
zone = var.default_zone
allow_stopping_for_update = "true"

resources {
cores = 2
memory = 2
}

boot_disk {
initialize_params {
image_id = data.yandex_compute_image.img.id
}
}

  dynamic secondary_disk {
   for_each = "${yandex_compute_disk.disk.*.id}"
   content {
        disk_id = yandex_compute_disk.disk["${secondary_disk.key}"].id
   }
}


  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }