
variable "aws_region" { type = string }
variable "env"        { type = string  default = "prod" }

# OT Configuration
variable "ot_vpc_id"         { type = string }
variable "ot_tgw_subnet_ids" { type = list(string) }
variable "ot_tgw_id"         { type = string }
variable "ot_tgw_asn"        { type = number }
variable "ot_cgw_public_ips" { type = list(string) }
variable "ot_vpn_tunnel_inside_cidrs" {
  type    = list(string)
  default = []
}

# IT Configuration
variable "it_vpc_id"         { type = string }
variable "it_tgw_subnet_ids" { type = list(string) }
variable "it_tgw_id"         { type = string }
variable "it_tgw_asn"        { type = number }
variable "it_cgw_public_ips" { type = list(string) }
variable "it_vpn_tunnel_inside_cidrs" {
  type    = list(string)
  default = []
}

# Common Configuration
variable "cgw_bgp_asn"    { type = number default = 2009 }

variable "tgw_default_route_table_association" { type = bool default = false }
variable "tgw_default_route_table_propagation" { type = bool default = false }
variable "propagate_vpc_attachment"            { type = bool default = true }
variable "propagate_vpn_attachment"            { type = bool default = true }

variable "vpn_tunnel_psk" {
  type        = string
  default     = null
  sensitive   = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
