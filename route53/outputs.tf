output "local_dns_zone" {
  value = aws_route53_zone.wakatech-local
}
output "public_dns_zone" {
  value = aws_route53_zone.wakatech-public
}