
provider "aws" {
    region= "us-east-1"
}

variable "inputname" {
    type = string
    description = "Set the name of the VPC"
}
resource "aws_vpc" "myvpc" {
    cidr_block= "10.0.0.0/16"
       tags = {
        Name = var.inputname
   }
}
output "vpcid" {
    value = aws_vpc.myvpc.id
}