resource "aws_egress_only_internet_gateway" "demo-egress-only-ig" {
  vpc_id = aws_vpc.egress-vpc.id

  tags = {
    name = "demo-egress-ig-ipv6-out-traffic"
  }
}