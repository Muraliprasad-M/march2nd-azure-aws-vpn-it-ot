
aws_region = "eu-west-2"
env        = "prod"
domain     = "OT"

# Use existing OT TGW
create_tgw      = false
existing_tgw_id = "tgw-xxxxxxxxxxxxxxxxx" # TODO: replace with actual OT TGW ID

vpc_id         = "vpc-0abcde123456789ab" # TODO: replace with real OT VPC ID
tgw_subnet_ids = [
  "subnet-0aaa1111aaa1111aa", # OT private TGW subnet AZ1
  "subnet-0bbb2222bbb2222bb", # OT private TGW subnet AZ2
  "subnet-0ccc3333ccc3333cc"  # OT private TGW subnet AZ3
]

tgw_asn = 64512

# OT Azure VNG public IP(s) – single-IP active-standby
cgw_public_ips = ["52.12.34.56"] # TODO: replace with OT Azure VPN GW public IP
cgw_bgp_asn    = 65515

# tags
tags = {
  project = "s2s"
  domain  = "OT"
}
