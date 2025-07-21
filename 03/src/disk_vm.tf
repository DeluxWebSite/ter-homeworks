data "yandex_compute_image" "my_image" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_disk" "default" {
  count    = var.count_vm
  name     = "disk-name-${count.index}"
  size     = var.size
  type     = var.type
  zone     = var.default_zone
  image_id = data.yandex_compute_image.my_image.id      # "fd8nru7hnggqhs9mkqps"

  labels = {
    environment = "test"
  }
}

# -----------------------------------------

resource "yandex_compute_instance" "storage" {

name = var.name
platform_id = var.vm_platform
zone = var.default_zone
allow_stopping_for_update = "true"

resources {
    cores         = var.cores # Минимальное значение vCPU = 2. ccылка: https://cloud.yandex.ru/docs/compute/concepts/performance-levels
    memory        = var.memory
    core_fraction = var.core_fraction
  }

boot_disk {
initialize_params {
image_id = data.yandex_compute_image.img.id
}
}

  dynamic "secondary_disk" {
    for_each = { for s in yandex_compute_disk.storage[*]: s.name=> s }
    content {
        disk_id=secondary_disk.value.id
    }
}


  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }