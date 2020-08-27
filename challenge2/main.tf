provider "aws" {
    region= "us-east-1"
}
variable "ingressrule" {
  type = list(number)
  default = [80,443]
}
variable "egressrule" {
  type = list(number)
  default = [80,443]
}
resource "aws_instance" "DBServer" {
  ami           = "ami-02354e95b39ca8dec"
  instance_type = "t2.micro"
  
 tags = {
        Name = "nlamsdb01"
   }
}
resource "aws_instance" "WebServer" {
  ami           = "ami-02354e95b39ca8dec"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  user_data     = <<-EOF
                  #!/bin/bash
                  sudo su
                  yum -y install httpd
                  echo "<p> WebServer! </p>" >> /var/www/html/index.html
                  sudo systemctl enable httpd
                  sudo systemctl start httpd
                  EOF
 tags = {
        Name = "nlamsweb01"
   }
}
resource "aws_eip" "elasticip"{
    instance = aws_instance.WebServer.id
}
    
resource "aws_security_group" "webtraffic" {
  name        = "allow_https-any"
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
        Name = "ports_allow-any"
  }
}
output "Webserverprivateip" {
    value = aws_instance.WebServer.private_ip
}
output "securitygroupname" {
    value = aws_security_group.webtraffic.name
}
output "EIP" {
    value = aws_eip.elasticip.public_ip
}