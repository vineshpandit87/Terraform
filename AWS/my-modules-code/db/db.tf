resource "aws_instance" "db" {
  ami           = "ami-09d8b5222f2b93bf0"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_db_name
  }
}

output "db_server_name" {
    value = aws_instance.db.id
}