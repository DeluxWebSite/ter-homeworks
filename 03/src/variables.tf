###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default="b1gm0v9ctsng7jrgr49v"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default="b1g9kesmig0rfm09tt03"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "platform_standard-v1" {
  type        = string
  default     = "standard-v1"
  description = "platform_id"
}

variable "platform_standard-v3" {
  type        = string
  default     = "standard-v3"
  description = "platform_id"
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHUbDaUR/AYQE3NziN3KYg/xIyXEQAYdHt+jh545WkUo ubuntu@ubuntu"
  description = "ssh-keygen -t ed25519"
}

variable "count_vm" {
  type        = number
  default     = 3
}

variable "size" {
  type        = number
  default     = 8
}

variable "type" {
  type        = string
  default     = "network-ssd"
}

variable "cores" {
  type        = number
  default     = 2
}
variable "memory" {
  type        = number
  default     = 2
}
variable "core_fraction" {
  type        = number
  default     = 20
}
variable "name" {
  type        = string
  default     = "vm-from-disks"
}