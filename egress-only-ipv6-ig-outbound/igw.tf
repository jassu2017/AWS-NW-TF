resource "aws_internet_gateway" "egress-ig" {
  vpc_id = aws_vpc.egress-vpc.id

  tags = {
    name = "demo-egress-ig-ipv6-out-traffic"
  }



}