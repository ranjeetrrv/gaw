resource "aws_route53_zone" "wakatech-local" {
  name          = var.local_dns_zone_name
  force_destroy = true
  vpc {
    vpc_id = data.terraform_remote_state.vpc["admin"].outputs.vpc_details.vpc_id
  }
  lifecycle {
    ignore_changes = [vpc]
  }
}

resource "aws_route53_zone_association" "wakatech-local" {
  for_each = toset(var.workspaces)
  zone_id  = aws_route53_zone.wakatech-local.zone_id
  vpc_id   = data.terraform_remote_state.vpc[each.key].outputs.vpc_details.vpc_id
}

resource "aws_route53_zone" "wakatech-public" {
  name          = var.public_dns_zone_name
  force_destroy = true
}

resource "aws_route53_record" "wakatech-public" {
  for_each = var.public_dns_records
  zone_id  = aws_route53_zone.wakatech-public.zone_id
  name     = each.value.name
  type     = each.value.type
  ttl      = each.value.ttl
  records  = each.value.records
}