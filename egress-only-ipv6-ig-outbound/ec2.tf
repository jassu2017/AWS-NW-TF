resource "aws_instance" "egress-bastion" {
  ami                         = "ami-00bb6a80f01f03502"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "egress-pubk"
  vpc_security_group_ids      = [aws_security_group.egress-sg-pub.id]
  subnet_id                   = aws_subnet.egress-pub-sub.id
  tags = {

    name = "demo-egress-ig-ipv6-out-traffic"
  }

}

resource "aws_instance" "egress-ec2-pvt" {
  ami                    = "ami-00bb6a80f01f03502"
  instance_type          = "t2.micro"
  key_name               = "egress-pubk"
  vpc_security_group_ids = [aws_security_group.egress-sg-pvt.id]
  subnet_id              = aws_subnet.egress-pvt-sub.id
  ipv6_address_count     = 1


  tags = {

    name = "demo-egress-ig-ipv6-out-traffic"
  }

}

resource "aws_key_pair" "demo-key" {
  key_name   = "egress-pubk"
  public_key = file("./egress-pubk.pub")

}
