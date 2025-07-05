resource "aws_subnet" "egress-pub-sub" {
  vpc_id            = aws_vpc.egress-vpc.id
  cidr_block        = cidrsubnet(aws_vpc.egress-vpc.cidr_block, 4, 1)
  availability_zone = "${var.region}a"

  tags = {
    name = "demo-egress-ig-ipv6-out-traffic-pub"
  }

}

resource "aws_subnet" "egress-pvt-sub" {
  vpc_id                          = aws_vpc.egress-vpc.id
  cidr_block                      = cidrsubnet(aws_vpc.egress-vpc.cidr_block, 4, 2)
  availability_zone               = "${var.region}b"
  assign_ipv6_address_on_creation = true

  ipv6_cidr_block = cidrsubnet(aws_vpc.egress-vpc.ipv6_cidr_block, 8, 1)

  tags = {
    name = "demo-egress-ig-ipv6-out-traffic-pvt"

  }

  depends_on = [aws_vpc.egress-vpc]


}
