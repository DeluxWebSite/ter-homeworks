resource "yandex_compute_disk" "default" {
  count    = var.count_vm
  name     = "disk-name-${count.index}"
  size     = var.size
  type     = var.type
  zone     = var.default_zone
  image_id = "fd8nru7hnggqhs9mkqps"

  labels = {
    environment = "test"
  }
}

# -----------------------------------------

resource "yandex_compute_instance" "storage" {

name = "vm-from-disks"
platform_id = var.vm_platform
zone = var.default_zone
allow_stopping_for_update = "true"

resources {
    cores         = var.vms_resources.vm_web_resources.cores # Минимальное значение vCPU = 2. ccылка: https://cloud.yandex.ru/docs/compute/concepts/performance-levels
    memory        = var.vms_resources.vm_web_resources.memory
    core_fraction = var.vms_resources.vm_web_resources.core_fraction
  }

boot_disk {
initialize_params {
image_id = "fd8g64rcu9fq5kpfqls0"
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