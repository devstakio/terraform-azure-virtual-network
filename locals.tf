locals {
  public_address_prefix     = cidrsubnet(var.address_space, 2, 0)
  kubernetes_address_prefix = cidrsubnet(var.address_space, 2, 1)
}