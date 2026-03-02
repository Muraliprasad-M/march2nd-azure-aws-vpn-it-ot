
variable "aws_region" { type = string }
variable "env"        { type = string  default = "prod" }
variable "domain"     { type = string  description = "Domain name (e.g., OT or IT)" }

variable "vpc_id"         { type = string }
variable "tgw_subnet_ids" { type = list(string) }

variable "create_tgw"     { type = bool   default = true }
variable "existing_tgw_id"{ type = string default = null }
variable "tgw_asn"        { type = number default = 64512 }

variable "cgw_public_ips" { type = list(string) }
variable "cgw_bgp_asn"    { type = number default = 65515 }

variable "tgw_default_route_table_association" { type = bool default = false }
variable "tgw_default_route_table_propagation" { type = bool default = false }
variable "propagate_vpc_attachment"            { type = bool default = true }
variable "propagate_vpn_attachment"            { type = bool default = true }

variable "vpn_tunnel_inside_cidrs" {
  type        = list(string)
  default     = []
  description = "Optional list of /30 CIDRs: [conn0_tun1, conn0_tun2, conn1_tun1, conn1_tun2, ...]"
}

variable "vpn_tunnel_psk" {
  type        = string
  default     = null
  sensitive   = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
