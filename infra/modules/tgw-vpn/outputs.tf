
output "tgw_id" {
  value = local.tgw_id
}

output "tgw_route_table_id" {
  value = aws_ec2_transit_gateway_route_table.this.id
}

output "tgw_vpc_attachment_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.this.id
}

output "customer_gateways" {
  value = { for k, v in aws_customer_gateway.azure : k => { id = v.id, public_ip = v.ip_address } }
}

output "vpn_connections" {
  value = {
    for k, v in aws_vpn_connection.azure :
    k => {
      id                     = v.id
      tgw_attachment_id      = v.transit_gateway_attachment_id
      tunnel1_outside_ip     = v.tunnel1_address
      tunnel2_outside_ip     = v.tunnel2_address
      tunnel1_preshared_key  = v.tunnel1_preshared_key
      tunnel2_preshared_key  = v.tunnel2_preshared_key
    }
  }
}
