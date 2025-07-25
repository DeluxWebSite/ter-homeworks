variable "vm_web_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "ubuntu version"
}
variable "vm_db_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "ubuntu version"
}
variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform ID"
}
variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform ID"
}
variable "vm_web_instance_name" {
  type = string
  default = "netology-develop-platform-web"
}
variable "vm_db_instance_name" {
  type = string
  default = "netology-develop-platform-db"
}
variable "vms_resources" {
  description = "Resources for all vms"
  type        = map(map(number))
  default     = {
    vm_web_resources = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    vm_db_resources = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}


variable "common_metadata" {
  description = "metadata for all vms"
  type        = map(string)
  default     = {
    serial-port-enable = "1"
    ssh-keys          = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHUbDaUR/AYQE3NziN3KYg/xIyXEQAYdHt+jh545WkUo ubuntu@ubuntu"
  }
}