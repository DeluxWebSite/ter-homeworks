resource "yandex_compute_instance" "web" {
<<<<<<< HEAD
  count = var.count_vm
  name        = "netology-develop-${count.index + 1}"
  platform_id = var.vm_platform
=======
  count = 2
  name        = "web-${count.index+1}"
  platform_id = var.platform_standard-v1
>>>>>>> 85139dd9a45741fe96c661593b86c4ae0001e86a
  resources {
    cores         = var.vms_resources.vm_web_resources.cores # Минимальное значение vCPU = 2. ccылка: https://cloud.yandex.ru/docs/compute/concepts/performance-levels
    memory        = var.vms_resources.vm_web_resources.memory
    core_fraction = var.vms_resources.vm_web_resources.core_fraction
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