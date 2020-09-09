
provider "aws" {
    region= "us-east-1"
}

variable "inputname" {
    type = string
    description = "Set the name of the VPC"
}
resource "aws_vpc" "myvpc2" {
    cidr_block= "192.168.0.0/24"
       tags = {
        Name = var.inputname
   }
}
output "vpcid" {
    value = aws_vpc.myvpc.id
}
######Used for importing vpc-terraform import aws_vpc.myvpc2 vpc-0a181b09d5f655c59###
