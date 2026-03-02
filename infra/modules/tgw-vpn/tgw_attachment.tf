
resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  transit_gateway_id     = local.tgw_id
  vpc_id                 = var.vpc_id
  subnet_ids             = var.tgw_subnet_ids
  appliance_mode_support = "disable"
  dns_support            = "enable"
  ipv6_support           = "disable"

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-tgw-att"
  })
}
