resource "aws_route_table" "egress-rt-pub" {
  vpc_id = aws_vpc.egress-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.egress-ig.id
  }

  tags = {
    name = "demo-egress-ig-ipv6-out-traffic"
  }

}

resource "aws_route_table_association" "egress-rt-pub-asso" {
  subnet_id      = aws_subnet.egress-pub-sub.id
  route_table_id = aws_route_table.egress-rt-pub.id

}


resource "aws_route_table" "egress-rt-pvt" {
  vpc_id = aws_vpc.egress-vpc.id

  route  {
    ipv6_cidr_block  = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.demo-egress-only-ig.id
    
  }

  tags = {
    name = "demo-egress-ig-ipv6-out-traffic"
  }

}

resource "aws_route_table_association" "egress-rt-pvt-asso" {
  subnet_id      = aws_subnet.egress-pvt-sub.id
  route_table_id = aws_route_table.egress-rt-pvt.id

}