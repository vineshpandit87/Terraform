provider "aws" {
    region= "us-east-1"
}
module "db" {
    source = "./db"
    server_names = ["mariadb","mysqldb","sqldb"]
}
output "private_ips" {
    value = module.db.PrivateIP
}