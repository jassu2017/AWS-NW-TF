resource "aws_security_group" "egress-sg-pub" {
  name        = "egress-sg-pub"
  description = "Allow SSH  ports"
  vpc_id      = aws_vpc.egress-vpc.id

  egress = [
    {
      description      = "for all outgoing traffics"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  ingress = [
    {

      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = true
    }



  ]

  tags = {
    Name = "egress-sg-pub"
  }


}


resource "aws_security_group" "egress-sg-pvt" {
  name        = "egress-sg-pvt"
  description = "Allow SSH  ports"
  vpc_id      = aws_vpc.egress-vpc.id

      egress = [
    {
      description      = "for all outgoing traffics"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = []
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  ingress = [
    {

      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.vpc_cidr_block]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = true
    }



  ]

  tags = {
    Name = "egress-sg-pvt"
  }


}