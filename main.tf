locals {
  name = var.name_postfix == null ? format("%s-eip", var.name) : format("%s-eip-%s", var.name, var.name_postfix)
}

resource "huaweicloud_vpc_eip" "main" {
  name   = local.name
  region = var.region

  auto_renew = var.auto_renew

  publicip {
    type       = var.eip.type
    ip_address = var.eip.ip_address
    ip_version = var.eip.ip_version
  }

  bandwidth {
    name        = format("%s-bandwidth", local.name)
    size        = var.eip.bandwidth.size
    share_type  = var.eip.bandwidth.share_type
    charge_mode = var.eip.bandwidth.charge_mode
  }

  tags = var.tags
}
