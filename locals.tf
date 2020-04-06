locals {
  public_address_prefix = cidrsubnet(var.address_space, 2, 0)
  application_address_prefix = cidrsubnet(var.address_space, 2, 1)
  data_address_prefix = cidrsubnet(var.address_space, 2, 2)
}