provider "aws" {
    region= "us-east-1"
}
module "db" {
    source = "./db"
    server_names = ["mariadb","mysqldb"]
}
output "private_ips" {
    value = module.db.PrivateIP
}
output "ec2_names" {
    value = module.db.name
}