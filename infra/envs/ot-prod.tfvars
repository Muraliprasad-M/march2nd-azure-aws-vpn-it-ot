
aws_region = "eu-west-2"
env        = "prod"
domain     = "OT"

# Use existing OT TGW
create_tgw      = false
existing_tgw_id = "tgw-046432679404c0c8e" # TODO: replace with actual OT TGW ID

vpc_id         = "vpc-08d937b89707ea8ac" # TODO: replace with real OT VPC ID
tgw_subnet_ids = [
  "subnet-0ba3462654aaafb54", # OT private TGW subnet AZ1
  "subnet-0fd76b1d3f1bc7523", # OT private TGW subnet AZ2
  "subnet-072adb60a59888568"  # OT private TGW subnet AZ3
]

tgw_asn = 64513

# OT Azure VNG public IP(s) – single-IP active-standby
cgw_public_ips = ["52.169.226.10"] # TODO: replace with OT Azure VPN GW public IP
cgw_bgp_asn    = 2009

# tags
tags = {
  project = "s2s"
  domain  = "OT"
}
