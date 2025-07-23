## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_analytics-vm"></a> [analytics-vm](#module\_analytics-vm) | git::https://github.com/udjin10/yandex_compute_instance.git | main |
| <a name="module_marketing-vm"></a> [marketing-vm](#module\_marketing-vm) | git::https://github.com/udjin10/yandex_compute_instance.git | main |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [template_file.cloudinit](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_analytics_vm_env"></a> [analytics\_vm\_env](#input\_analytics\_vm\_env) | n/a | `string` | `"stage"` | no |
| <a name="input_analytics_vm_image_family"></a> [analytics\_vm\_image\_family](#input\_analytics\_vm\_image\_family) | n/a | `string` | `"ubuntu-2004-lts"` | no |
| <a name="input_analytics_vm_instance_count"></a> [analytics\_vm\_instance\_count](#input\_analytics\_vm\_instance\_count) | n/a | `number` | `1` | no |
| <a name="input_analytics_vm_instance_name"></a> [analytics\_vm\_instance\_name](#input\_analytics\_vm\_instance\_name) | n/a | `string` | `"analytics-web"` | no |
| <a name="input_analytics_vm_labels"></a> [analytics\_vm\_labels](#input\_analytics\_vm\_labels) | n/a | `map` | <pre>{<br/>  "owner": "my-cloud",<br/>  "project": "analytics"<br/>}</pre> | no |
| <a name="input_analytics_vm_public_ip"></a> [analytics\_vm\_public\_ip](#input\_analytics\_vm\_public\_ip) | n/a | `bool` | `true` | no |
| <a name="input_analytics_vm_serial_port_enable"></a> [analytics\_vm\_serial\_port\_enable](#input\_analytics\_vm\_serial\_port\_enable) | n/a | `bool` | `true` | no |
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | `"b1gm0v9ctsng7jrgr49v"` | no |
| <a name="input_default_cidr"></a> [default\_cidr](#input\_default\_cidr) | https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | <pre>[<br/>  "10.0.1.0/24"<br/>]</pre> | no |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | `"b1g9kesmig0rfm09tt03"` | no |
| <a name="input_marketing_vm_env"></a> [marketing\_vm\_env](#input\_marketing\_vm\_env) | n/a | `string` | `"develop"` | no |
| <a name="input_marketing_vm_image_family"></a> [marketing\_vm\_image\_family](#input\_marketing\_vm\_image\_family) | n/a | `string` | `"ubuntu-2004-lts"` | no |
| <a name="input_marketing_vm_instance_count"></a> [marketing\_vm\_instance\_count](#input\_marketing\_vm\_instance\_count) | n/a | `number` | `1` | no |
| <a name="input_marketing_vm_instance_name"></a> [marketing\_vm\_instance\_name](#input\_marketing\_vm\_instance\_name) | n/a | `string` | `"marketing-web"` | no |
| <a name="input_marketing_vm_labels"></a> [marketing\_vm\_labels](#input\_marketing\_vm\_labels) | n/a | `map` | <pre>{<br/>  "owner": "my-cloud",<br/>  "project": "marketing"<br/>}</pre> | no |
| <a name="input_marketing_vm_public_ip"></a> [marketing\_vm\_public\_ip](#input\_marketing\_vm\_public\_ip) | n/a | `bool` | `true` | no |
| <a name="input_marketing_vm_serial_port_enable"></a> [marketing\_vm\_serial\_port\_enable](#input\_marketing\_vm\_serial\_port\_enable) | n/a | `bool` | `true` | no |
| <a name="input_packages"></a> [packages](#input\_packages) | n/a | `list(string)` | <pre>[<br/>  "vim",<br/>  "nginx"<br/>]</pre> | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Location of SSH public key. | `string` | `"~/.ssh/id_ed25519.pub"` | no |
| <a name="input_token"></a> [token](#input\_token) | OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC network&subnet name | `string` | `"develop"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_out"></a> [out](#output\_out) | n/a |
