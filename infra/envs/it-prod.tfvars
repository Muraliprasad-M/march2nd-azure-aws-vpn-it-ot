
aws_region = "eu-west-2"
env        = "prod"
domain     = "IT"

# Use existing IT TGW
create_tgw      = false
existing_tgw_id = "tgw-xxxxxxxxxxxxxxxxx" # TODO: replace with actual IT TGW ID

# IT VPC and three TGW attachment private subnets (one per AZ)
# Names from request for reference:
#  Subnet1-it-tgw-AZ1, Subnet2-it-tgw-AZ2, Subnet3-it-tgw-AZ3
vpc_id         = "vpc-it-xxxxxxxxxxxxxxxxx"           # TODO: replace with real IT VPC ID
tgw_subnet_ids = [
  "subnet-it-az1-xxxxxxxxxxxxx", # Subnet1-it-tgw-AZ1 (replace with real subnet ID)
  "subnet-it-az2-xxxxxxxxxxxxx", # Subnet2-it-tgw-AZ2 (replace with real subnet ID)
  "subnet-it-az3-xxxxxxxxxxxxx"  # Subnet3-it-tgw-AZ3 (replace with real subnet ID)
]

tgw_asn = 64512

# IT uses a separate Azure VPN Gateway (single-IP active-standby unless you add a 2nd IP)
cgw_public_ips = ["203.0.113.10"] # TODO: replace with IT Azure VPN GW public IP
cgw_bgp_asn    = 65515

# tags
tags = {
  project = "s2s"
  domain  = "IT"
}
