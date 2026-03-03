
aws_region = "eu-west-2"
env        = "prod"
domain     = "IT"

# Use existing IT TGW
create_tgw      = false
existing_tgw_id = "tgw-0197ed40c5a15e3dd" # TODO: replace with actual IT TGW ID

# IT VPC and three TGW attachment private subnets (one per AZ)
# Names from request for reference:
#  Subnet1-it-tgw-AZ1, Subnet2-it-tgw-AZ2, Subnet3-it-tgw-AZ3
vpc_id         = "vpc-0f88c9baaa557c312"           # TODO: replace with real IT VPC ID
tgw_subnet_ids = [
  "subnet-0c51accf898302ac3", # Subnet1-it-tgw-AZ1 (replace with real subnet ID)
  "subnet-0d601cef22549f2e6", # Subnet2-it-tgw-AZ2 (replace with real subnet ID)
  "subnet-0e014cbeae438f221"  # Subnet3-it-tgw-AZ3 (replace with real subnet ID)
]

tgw_asn = 64512

# IT uses a separate Azure VPN Gateway (single-IP active-standby unless you add a 2nd IP)
cgw_public_ips = ["52.169.226.10"] # TODO: replace with IT Azure VPN GW public IP
cgw_bgp_asn    = 2009

# tags
tags = {
  project = "s2s"
  domain  = "IT"
}
