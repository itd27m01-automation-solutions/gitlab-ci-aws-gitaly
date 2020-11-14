variable "environment" {
  type        = string
  description = "The name of used environment"
}

variable "gitlab_gitaly_ami" {
  description = "AMI id for infra VMs Ubuntu 20.04 by default"
  default     = "ami-0a91cd140a1fc148a"
  type        = string
}

variable "gitlab_gitaly_flavor" {
  description = "Flavor for gitlab Gitaly servers"
  default     = "t2.micro"
  type        = string
}

variable "gitlab_private_subnets" {
  description = "List of private subnets to create servers in"
  type        = list(string)
}

variable "gitlab_gitaly_sg_ids" {
  description = "Security group ids for gitlab app servers"
  type        = list(string)
}

variable "gitlab_keypair" {
  description = "Key pair name for infra tasks"
  type        = string
}

variable "gitlab_iam_profile_name" {
  description = "The name of IAM profile for GitLab instances"
  type        = string
}

variable "gitlab_gitaly_storage" {
  description = "Volume size for gitaly storage"
  default     = 10
  type        = number
}