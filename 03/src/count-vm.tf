resource "yandex_compute_instance" "web" {
  count = 2
  name        = "web-${count.index+1}"
  platform_id = var.platform_standard-v1
  resources {
	cores     	= 2
	memory    	= 1
	core_fraction = 5
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