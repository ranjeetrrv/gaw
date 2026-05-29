resource "aws_eip" "nat" {
  count = 1
  vpc   = true
  tags  = local.tags
}

module "vpc" {
  source                             = "terraform-aws-modules/vpc/aws"
  version                            = "3.14.0"
  name                               = "${local.environment}-${var.product}-vpc"
  azs                                = local.env_conf.azs
  cidr                               = local.vpc_conf.vpc_cidr_block
  private_subnets                    = local.vpc_conf.private_subnets
  public_subnets                     = local.vpc_conf.public_subnets
  database_subnets                   = local.vpc_conf.database_subnets
  create_database_subnet_route_table = true
  database_dedicated_network_acl     = true
  database_inbound_acl_rules         = [{ "cidr_block" : "0.0.0.0/0", "from_port" : 0, "protocol" : "-1", "rule_action" : "allow", "rule_number" : 100, "to_port" : 0 }]
  database_outbound_acl_rules        = [{ "cidr_block" : "0.0.0.0/0", "from_port" : 0, "protocol" : "-1", "rule_action" : "allow", "rule_number" : 100, "to_port" : 0 }]
  private_dedicated_network_acl      = true
  private_inbound_acl_rules          = [{ "cidr_block" : "0.0.0.0/0", "from_port" : 0, "protocol" : "-1", "rule_action" : "allow", "rule_number" : 100, "to_port" : 0 }]
  private_outbound_acl_rules         = [{ "cidr_block" : "0.0.0.0/0", "from_port" : 0, "protocol" : "-1", "rule_action" : "allow", "rule_number" : 100, "to_port" : 0 }]
  public_dedicated_network_acl       = true
  public_inbound_acl_rules           = [{ "cidr_block" : "0.0.0.0/0", "from_port" : 0, "protocol" : "-1", "rule_action" : "allow", "rule_number" : 100, "to_port" : 0 }]
  public_outbound_acl_rules          = [{ "cidr_block" : "0.0.0.0/0", "from_port" : 0, "protocol" : "-1", "rule_action" : "allow", "rule_number" : 100, "to_port" : 0 }]
  create_database_subnet_group       = true
  enable_dns_hostnames               = true
  enable_nat_gateway                 = true
  single_nat_gateway                 = true
  reuse_nat_ips                      = true
  external_nat_ip_ids                = aws_eip.nat.*.id
  tags                               = local.tags
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}

module "vpc-peering" {
  count  = local.environment != "admin" ? 1 : 0
  source = "grem11n/vpc-peering/aws"
  providers = {
    aws.this = aws
    aws.peer = aws
  }
  version             = "4.1.0"
  auto_accept_peering = true
  peer_dns_resolution = true
  this_dns_resolution = true
  peer_vpc_id         = data.terraform_remote_state.vpc.0.outputs.vpc_details.vpc_id
  this_vpc_id         = module.vpc.vpc_id
  tags                = local.tags
}