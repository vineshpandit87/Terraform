provider "aws" {
    region = "us-east-1"
}

module "db" {
    source = "./DB"
}

module "web" {
    source = "./WEB"
}

output "PrivateIP" {
    value = module.db.PrivateIP
}

output "PublicIP" {
    value = module.web.pub_ip
}