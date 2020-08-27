
provider "aws" {
    region= "us-east-1"
}
#####String Variable####
variable "vpcname" {
    type   = "string"
    default= "myvpc"

}

######Number Variable###
variable "sshport" {
    type    = number
    default = 22

}

#########Variable Boolean######
variable "enabled" {
    default = true
}
######Variable List#######
variable "mylist" {
    type = list(string)
    default = ["value1","value2"]

}
#####Variable map######
variable "mymap" {
    type = map
    default = {
        key1 = "value1"
        key2 = "value2"
    }
}
variable "inputname" {
    type = string
    description = "Set the name of the VPC"
}
resource "aws_vpc" "myvpc" {
    cidr_block= "10.0.0.0/16"
    tags = {
        Name = var.vpcname
    }
tags = {
        Name = var.inputname
    }
###lists####
 #   tags = {
 #       Name = var.mylist[0]
  #  }
   # tags = {
    #    Name = var.mymap["key1"]
   # }
}