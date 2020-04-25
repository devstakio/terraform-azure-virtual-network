## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| address\_space | List of address spaces that is used the virtual network. You can supply more than one address space | `any` | n/a | yes |
| dns\_servers | List of IP addresses of DNS servers | `list` | <pre>[<br>  "168.63.129.16"<br>]</pre> | no |
| name | The name of the virtual network. Changing this forces a new resources to be created | `any` | n/a | yes |
| resource\_group\_name | The name of the resource group which all resources belong to. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| kubernetes\_subnet\_id | n/a |
| kubernetes\_subnet\_name | n/a |
| network\_name | n/a |
| public\_subnet\_id | n/a |
