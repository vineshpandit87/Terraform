provider "aws" {
    region= "us-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-02354e95b39ca8dec"
  instance_type = "t2.micro"

}
resource "aws_eip" "elasticip"{
    instance = aws_instance.ec2.id
}
output "EIP" {
    value = aws_eip.elasticip.public_ip
    
    
}
output "instance_ip_addr" {
  value = aws_instance.ec2.private_ip
}