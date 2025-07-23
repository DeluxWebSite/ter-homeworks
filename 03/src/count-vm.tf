resource "yandex_compute_instance" "web" {
  count = var.count_vm
  name        = "netology-develop-${count.index + 1}"
  platform_id = var.vm_platform
  resources {
    cores         = var.cores # Минимальное значение vCPU = 2. ccылка: https://cloud.yandex.ru/docs/compute/concepts/performance-levels
    memory        = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
	initialize_params {
  	image_id = data.yandex_compute_image.img2.id
	  }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
	subnet_id = yandex_vpc_subnet.develop.id
	nat   	= true
  }

  metadata = {
	ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}