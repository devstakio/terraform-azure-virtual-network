locals {
  public_address_prefixes     = [cidrsubnet(var.address_space, 2, 0)]
  kubernetes_address_prefixes = [cidrsubnet(var.address_space, 2, 1)]
}