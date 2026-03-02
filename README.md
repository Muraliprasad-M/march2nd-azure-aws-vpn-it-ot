
# OT & IT – AWS TGW + AWS S2S VPN to Azure (Terraform + Azure DevOps)

This repo refactors the previous single-domain setup into a reusable **module** and two environment files:
- **OT (prod)** and **IT (prod)**. Each can create its **own TGW**, attach its **own VPC**, and build its **own VPN** to Azure.

- Terraform **1.14.5**, AWS provider **6.32.1**
- Backend (provided by DevOps variable group `aws-prod`):
  - S3 bucket `ot-core-prod-euw2-tfstate`
  - DynamoDB `ot-core-prod-euw2-tfstate-lock`
  - Keys per domain: `networking/ot-prod/tgw-vpn.tfstate`, `networking/it-prod/tgw-vpn.tfstate`

## Structure
```
infra/
  modules/tgw-vpn/*.tf
  envs/ot-prod.tfvars
  envs/it-prod.tfvars
  *.tf (root wraps module)
azure-pipelines.yml
```

## Running locally
**OT**
```bash
cd infra
terraform init   -backend-config="bucket=ot-core-prod-euw2-tfstate"   -backend-config="key=networking/ot-prod/tgw-vpn.tfstate"   -backend-config="region=eu-west-2"   -backend-config="dynamodb_table=ot-core-prod-euw2-tfstate-lock"
terraform plan  -var-file="envs/ot-prod.tfvars"
terraform apply -var-file="envs/ot-prod.tfvars"
```

**IT**
```bash
cd infra
terraform init   -backend-config="bucket=ot-core-prod-euw2-tfstate"   -backend-config="key=networking/it-prod/tgw-vpn.tfstate"   -backend-config="region=eu-west-2"   -backend-config="dynamodb_table=ot-core-prod-euw2-tfstate-lock"
terraform plan  -var-file="envs/it-prod.tfvars"
terraform apply -var-file="envs/it-prod.tfvars"
```

## Notes
- **IT domain** is configured to **create a second TGW** (dedicated) per your request.
- Each domain can use **single-IP** or **active-active** Azure gateways by setting one or two IPs in `cgw_public_ips`.
- If you set `vpn_tunnel_psk`, mirror it in Azure. Otherwise, AWS generates PSKs; read them from `terraform-outputs-*.json` artifacts after apply.
- Replace placeholder VPC/subnet IDs and Azure public IPs in `envs/*.tfvars` before running.
