
provider "aws" {
    region= "ap-south-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block= "10.0.0.0/16"
}