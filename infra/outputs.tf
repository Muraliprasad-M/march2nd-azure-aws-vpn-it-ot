
output "tgw_id" {
  value = module.tgw_vpn.tgw_id
}

output "tgw_route_table_id" {
  value = module.tgw_vpn.tgw_route_table_id
}

output "tgw_vpc_attachment_id" {
  value = module.tgw_vpn.tgw_vpc_attachment_id
}

output "customer_gateways" {
  value = module.tgw_vpn.customer_gateways
}

output "vpn_connections" {
  value     = module.tgw_vpn.vpn_connections
  sensitive = true
}
