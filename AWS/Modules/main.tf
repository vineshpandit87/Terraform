provider "aws" {
    region= "us-east-1"
}

module "ec2module" {
    source = "./ec2"
    ec2name = "nlamsnw01"
    
  
}
output "nlamsnw01id"{
    value = module.ec2module.instance_id
    
}

module "ec2secondmodule" {
    source = "./ec2"
    ec2name = "nlamsnw02"
    
  
}
output "nlamsnw02id"{
    value = module.ec2secondmodule.instance_id
   
}
module "ec2thirdmodule" {
    source = "./ec2"
    ec2name = "nlamsnw03"
    
  ###Output###
}
output "nlamsnw03id"{
    value = module.ec2thirdmodule.instance_id
    
}
