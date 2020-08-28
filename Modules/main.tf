provider "aws" {
    region= "us-east-1"
}

module "ec2module" {
    source = "./ec2"
    ec2name = "Name from Module"
    
  
}
module "ec2secondmodule" {
    source = "./ec2"
    ec2name = "Vinesh"
    
  
}
module "ec2thirdmodule" {
    source = "./ec2"
    ec2name = "Ganesh"
    
  
}
