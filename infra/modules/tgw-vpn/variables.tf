
variable "aws_region" { type = string }
variable "env"        { type = string }
variable "domain"     { type = string }

variable "vpc_id"         { type = string }
variable "tgw_subnet_ids" { type = list(string) }

variable "create_tgw"      { type = bool }
variable "existing_tgw_id" { type = string default = null }
variable "tgw_asn"         { type = number }

variable "cgw_public_ips" { type = list(string) }
variable "cgw_bgp_asn"    { type = number }

variable "tgw_default_route_table_association" { type = bool }
variable "tgw_default_route_table_propagation" { type = bool }
variable "propagate_vpc_attachment"            { type = bool }
variable "propagate_vpn_attachment"            { type = bool }

variable "vpn_tunnel_inside_cidrs" { type = list(string) }
variable "vpn_tunnel_psk"          { type = string default = null }

variable "tags" { type = map(string) default = {} }
