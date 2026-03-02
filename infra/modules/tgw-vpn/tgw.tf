
resource "aws_ec2_transit_gateway" "this" {
  count                              = var.create_tgw ? 1 : 0
  description                        = "${local.name_prefix}-tgw"
  amazon_side_asn                    = var.tgw_asn
  default_route_table_association    = var.tgw_default_route_table_association
  default_route_table_propagation    = var.tgw_default_route_table_propagation
  vpn_ecmp_support                   = "enable"
  dns_support                        = "enable"

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-tgw"
  })
}

locals {
  tgw_id = var.create_tgw ? aws_ec2_transit_gateway.this[0].id : var.existing_tgw_id
}
