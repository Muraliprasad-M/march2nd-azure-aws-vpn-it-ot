
resource "aws_customer_gateway" "azure" {
  for_each    = { for idx, ip in local.cgw_ips : tostring(idx) => ip }
  bgp_asn     = var.cgw_bgp_asn
  ip_address  = each.value
  type        = "ipsec.1"
  device_name = "Azure-VNG-${each.key}"

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-azure-cgw-${each.key}"
  })
}
