output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "app1_private_ip" {
  value = aws_instance.app1.private_ip
}
output "app2_private_ip" {
  value = aws_instance.app2.private_ip
}
output "db_private_ip" {
  value = aws_instance.db.private_ip
}

output "app1_instance_id" {
  value = aws_instance.app1.id
}

output "app2_instance_id" {
  value = aws_instance.app2.id
}

output "db_instance_id" {
  value = aws_instance.db.id
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
