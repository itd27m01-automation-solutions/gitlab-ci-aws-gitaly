# Gitaly terraform module for GitLab CI on AWS

Deploys gitaly servers with EBS volumes for GitLab CI deployment on AWS.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.5 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.14 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | The name of used environment | `string` | n/a | yes |
| gitlab\_gitaly\_ami | AMI id for infra VMs Ubuntu 20.04 by default | `string` | `"ami-0a91cd140a1fc148a"` | no |
| gitlab\_gitaly\_flavor | Flavor for gitlab Gitaly servers | `string` | `"t2.micro"` | no |
| gitlab\_gitaly\_sg\_ids | Security group ids for gitlab app servers | `list(string)` | n/a | yes |
| gitlab\_gitaly\_storage | Volume size for gitaly storage | `number` | `10` | no |
| gitlab\_iam\_profile\_name | The name of IAM profile for GitLab instances | `string` | n/a | yes |
| gitlab\_keypair | Key pair name for infra tasks | `string` | n/a | yes |
| gitlab\_private\_subnets | List of private subnets to create servers in | `list(string)` | n/a | yes |

## Outputs

No output.

