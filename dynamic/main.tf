provider "aws" {
    region= "us-east-1"
}
variable "ingressrule" {
  type = list(number)
  default = [80,443]
}
variable "egressrule" {
  type = list(number)
  default = [80,443,25,3036,8080]
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
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrule
    content {
    from_port = port.value
    to_port = port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
            }
  }
    dynamic "egress" {
    iterator = port
    for_each = var.egressrule
    content {
    from_port = port.value
    to_port = port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
            }
  }
  tags = {
        Name = "ports_allow"
  }
}
output "ec2privateip" {
    value = aws_instance.ec2.private_ip
}
output "securitygroupname" {
    value = aws_security_group.webtraffic.name
}