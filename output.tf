output "gitlab_gitaly_ips" {
  description = "Gitaly servers IPs"
  value       = [for instance in aws_instance.gitlab_gitaly: instance.private_ip]
}
