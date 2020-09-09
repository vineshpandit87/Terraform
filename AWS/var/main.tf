provider "aws" {
    region= "us-east-1"
}
variable "number_of_servers"{
  type = number
}
resource "aws_instance" "ec2" {
  ami           = "ami-02354e95b39ca8dec"
  instance_type = "t2.micro"
  count = var.number_of_servers
}
##########Used to to run single tfvar file -terraform plan -var-file=prod.tfvars###########