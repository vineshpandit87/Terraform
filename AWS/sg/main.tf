provider "aws" {
    region= "us-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-02354e95b39ca8dec"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
 tags = {
        Name = "dc2nw01"
   }
}
resource "aws_security_group" "webtraffic" {
  name        = "allow_https"
  ingress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
   tags = {
        Name = "https_allow"
   }
}
output "ec2privateip" {
    value = aws_instance.ec2.private_ip
}
output "securitygroupname" {
    value = aws_security_group.webtraffic.name
}