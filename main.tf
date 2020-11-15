// Creates gitaly EC2 instances with EBS volume

resource "aws_instance" "gitlab_gitaly" {
  for_each = toset(var.gitlab_private_subnets)

  ami           = var.gitlab_gitaly_ami
  instance_type = var.gitlab_gitaly_flavor
  key_name      = var.gitlab_keypair

  subnet_id              = each.key
  vpc_security_group_ids = var.gitlab_gitaly_sg_ids

  iam_instance_profile = var.gitlab_iam_profile_name

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Application = "gitlab"
    Role        = "gitaly"
    Name        = "gitlab-gitaly-${var.environment}-${index(var.gitlab_private_subnets, each.key)}"
  }
}

resource "aws_ebs_volume" "gitaly" {
  count = length(var.gitlab_private_subnets)

  availability_zone = [for instance in aws_instance.gitlab_gitaly: instance.availability_zone][count.index]
  size              = var.gitlab_gitaly_storage
}

resource "aws_volume_attachment" "gitaly_ec2" {
  count = length(var.gitlab_private_subnets)

  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.gitaly[count.index].id
  instance_id = [for instance in aws_instance.gitlab_gitaly: instance.id][count.index]
}
