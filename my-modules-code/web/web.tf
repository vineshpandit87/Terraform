resource "aws_instance" "web" {
  ami           = "ami-09d8b5222f2b93bf0"
  instance_type = "t2.micro"
  user_data = file("./web/server-script.sh")
  vpc_security_group_ids = ["${var.instance_sec_name}"]
  tags = {
    Name = var.instance_web_name
  }
}

output "instance_web_id" {
    value = aws_instance.web.id
}
output "instance_sec_out"{
  value = 
}
