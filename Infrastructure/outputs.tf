output "Nginx_public_ip_" {
  value = aws_instance.nginx.public_ip
}
output "Nginx_private_ip" {
  value = aws_instance.nginx.private_ip
}
# ---------------------------------------------------------------------------
output "App_public_ip_" {
  value = aws_instance.app.public_ip
}
output "App_private_ip" {
  value = aws_instance.app.private_ip
}
# ---------------------------------------------------------------------------
output "REDIS_public_ip_" {
  value = aws_instance.redis.public_ip
}
output "REDIS_private_ip" {
  value = aws_instance.redis.private_ip
}
# ---------------------------------------------------------------------------
