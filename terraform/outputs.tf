output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}
output "app1_ip" {
  value = aws_instance.app1.private_ip
}

output "app2_ip" {
  value = aws_instance.app2.private_ip
}

output "db_ip" {
  value = aws_instance.db.private_ip
}