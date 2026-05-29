regions = {
  admin = "us-west-2"
}
workspaces = [
  "dev"
]
local_dns_zone_name = "wakatech.io"

public_dns_zone_name = "wakatech.com"

public_dns_records = {

  1 = {
    name    = "wakatech.com"
    type    = "A"
    ttl     = "60"
    records = ["3.137.70.250"]
  }
  2 = {
    name    = "csp.wakatech.com"
    type    = "A"
    ttl     = "60"
    records = ["20.219.155.182"]
  }
  3 = {
    name    = "qa.wakatech.com"
    type    = "A"
    ttl     = "60"
    records = ["3.230.83.192"]
  }
  4 = {
    name    = "www.wakatech.com"
    type    = "A"
    ttl     = "60"
    records = ["3.137.70.250"]
  }
  5 = {
    name    = "_8359860e08e2d645f49688a81943e593.wakatech.com"
    type    = "CNAME"
    ttl     = "60"
    records = ["D72871DCC0505D0B59293027FA81DC36.06FBC7D9FAD75A94084E50051E63D1AB.625402c360d0b.sectigo.com"]
  }
  6 = {
    name    = "wakatech.com"
    type    = "MX"
    ttl     = "3600"
    records = ["0 wakatech-com.mail.protection.outlook.com"]
  }

  7 = {
    name    = "qa-k8s.wakatech.com"
    type    = "CNAME"
    ttl     = "60"
    records = ["a1671f95b369a4695976a1f4d0579ff2-1313968648.us-west-2.elb.amazonaws.com"]
  }

  # 7 = {
  #   name    = "qa-v2.wakatech.com"
  #   type    = "A"
  #   ttl     = "60"
  #   records = ["44.239.42.75"]
  # }
  # 8 = {
  #   name    = "demo.wakatech.com"
  #   type    = "A"
  #   ttl     = "60"
  #   records = ["35.163.116.40"]
  # }
}