
resource "aws_eip" "web_ip" {
  instance = var.instance_web_id
}

output "instance_web_ip" {
    value = aws_eip.web_ip.public_ip
}