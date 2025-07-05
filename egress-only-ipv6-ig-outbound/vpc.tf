resource "aws_vpc" "egress-vpc" {
  cidr_block                       = var.vpc_cidr_block
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = true

  tags = {
    name = "demo-egress-ig-ipv6-out-traffic"
  }

}