
aws_region = "eu-west-2"
env        = "prod"

# OT Configuration - 2 VPNs to Azure
ot_vpc_id = "vpc-08d937b89707ea8ac"
ot_tgw_subnet_ids = [
  "subnet-0ba3462654aaafb54", # OT TGW subnet AZ1
  "subnet-0fd76b1d3f1bc7523", # OT TGW subnet AZ2
  "subnet-072adb60a59888568"  # OT TGW subnet AZ3
]
ot_tgw_id         = "tgw-046432679404c0c8e"
ot_tgw_asn        = 64513
ot_cgw_public_ips = [
  "4.159.61.37",    # ot-network-ss-vpn-azgw1 (ot-network-hub-uks-vpn-vnetgw)
  "40.127.209.247"  # ot-network-ss-vpn-azgw2 (ot-network-ss-neu-vpn-vnetgw)
]

# IT Configuration
it_vpc_id = "vpc-0f88c9baaa557c312"
it_tgw_subnet_ids = [
  "subnet-0c51accf898302ac3", # IT TGW subnet AZ1
  "subnet-0d601cef22549f2e6", # IT TGW subnet AZ2
  "subnet-0e014cbeae438f221"  # IT TGW subnet AZ3
]
it_tgw_id         = "tgw-0197ed40c5a15e3dd"
it_tgw_asn        = 64512
it_cgw_public_ips = ["52.169.226.10"]

# Common Configuration
cgw_bgp_asn = 2009

tags = {
  project = "s2s"
}
