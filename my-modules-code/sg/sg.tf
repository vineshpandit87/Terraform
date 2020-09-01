
resource "aws_security_group" "web_traffic" {
  name        = "allow_web_traffic"
  description = "Allow web traffic"
  

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
    from_port   = port.value
    to_port     = port.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
    from_port   = port.value
    to_port     = port.value
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = var.sg_name_id
  }
}

output "sg_name_id_out" {
    value = aws_security_group.web_traffic.id
}