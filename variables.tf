variable "name" {
  description = "The name of the virtual network. Changing this forces a new resources to be created"
}

variable "resource_group_name" {
  description = "The name of the resource group which all resources belong to."
}

variable "address_space" {
  description = "List of address spaces that is used the virtual network. You can supply more than one address space"
}

variable "dns_servers" {
  type    = list
  default = ["168.63.129.16"]

  description = "List of IP addresses of DNS servers"
}