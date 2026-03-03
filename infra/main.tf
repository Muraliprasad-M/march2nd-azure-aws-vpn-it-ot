
provider "aws" {
  region = var.aws_region
}

# OT VPN
module "ot_vpn" {
  source = "./modules/tgw-vpn"

  aws_region = var.aws_region
  env        = var.env
  domain     = "OT"

  vpc_id         = var.ot_vpc_id
  tgw_subnet_ids = var.ot_tgw_subnet_ids

  create_tgw      = false
  existing_tgw_id = var.ot_tgw_id
  tgw_asn         = var.ot_tgw_asn

  cgw_public_ips = var.ot_cgw_public_ips
  cgw_bgp_asn    = var.cgw_bgp_asn

  tgw_default_route_table_association = var.tgw_default_route_table_association
  tgw_default_route_table_propagation = var.tgw_default_route_table_propagation
  propagate_vpc_attachment            = var.propagate_vpc_attachment
  propagate_vpn_attachment            = var.propagate_vpn_attachment

  vpn_tunnel_inside_cidrs = var.ot_vpn_tunnel_inside_cidrs
  vpn_tunnel_psk          = var.vpn_tunnel_psk

  tags = merge(var.tags, { domain = "OT" })
}

# IT VPN
module "it_vpn" {
  source = "./modules/tgw-vpn"

  aws_region = var.aws_region
  env        = var.env
  domain     = "IT"

  vpc_id         = var.it_vpc_id
  tgw_subnet_ids = var.it_tgw_subnet_ids

  create_tgw      = false
  existing_tgw_id = var.it_tgw_id
  tgw_asn         = var.it_tgw_asn

  cgw_public_ips = var.it_cgw_public_ips
  cgw_bgp_asn    = var.cgw_bgp_asn

  tgw_default_route_table_association = var.tgw_default_route_table_association
  tgw_default_route_table_propagation = var.tgw_default_route_table_propagation
  propagate_vpc_attachment            = var.propagate_vpc_attachment
  propagate_vpn_attachment            = var.propagate_vpn_attachment

  vpn_tunnel_inside_cidrs = var.it_vpn_tunnel_inside_cidrs
  vpn_tunnel_psk          = var.vpn_tunnel_psk

  tags = merge(var.tags, { domain = "IT" })
}
