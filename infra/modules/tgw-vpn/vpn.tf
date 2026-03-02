
resource "aws_vpn_connection" "azure" {
  for_each            = aws_customer_gateway.azure
  transit_gateway_id  = local.tgw_id
  customer_gateway_id = each.value.id
  type                = "ipsec.1"
  static_routes_only  = false

  tunnel1_inside_cidr = length(var.vpn_tunnel_inside_cidrs) > (tonumber(each.key) * 2)     ? var.vpn_tunnel_inside_cidrs[tonumber(each.key) * 2]     : null
  tunnel2_inside_cidr = length(var.vpn_tunnel_inside_cidrs) > (tonumber(each.key) * 2 + 1) ? var.vpn_tunnel_inside_cidrs[tonumber(each.key) * 2 + 1] : null

  tunnel1_preshared_key = var.vpn_tunnel_psk
  tunnel2_preshared_key = var.vpn_tunnel_psk

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-tgw-azure-vpn-${each.key}"
  })
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpn_prop" {
  for_each                      = aws_vpn_connection.azure
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
  transit_gateway_attachment_id  = each.value.transit_gateway_attachment_id
}
