
provider "aws" {
  region = var.aws_region
}

module "tgw_vpn" {
  source = "./modules/tgw-vpn"

  aws_region = var.aws_region
  env        = var.env
  domain     = var.domain

  vpc_id         = var.vpc_id
  tgw_subnet_ids = var.tgw_subnet_ids

  create_tgw      = var.create_tgw
  existing_tgw_id = var.existing_tgw_id
  tgw_asn         = var.tgw_asn

  cgw_public_ips = var.cgw_public_ips
  cgw_bgp_asn    = var.cgw_bgp_asn

  tgw_default_route_table_association = var.tgw_default_route_table_association
  tgw_default_route_table_propagation = var.tgw_default_route_table_propagation
  propagate_vpc_attachment            = var.propagate_vpc_attachment
  propagate_vpn_attachment            = var.propagate_vpn_attachment

  vpn_tunnel_inside_cidrs = var.vpn_tunnel_inside_cidrs
  vpn_tunnel_psk          = var.vpn_tunnel_psk

  tags = var.tags
}
