resource "yandex_compute_instance" "web" {
  count = var.count_vm
  name        = "netology-develop-${count.index + 1}"
  platform_id = var.vm_platform
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