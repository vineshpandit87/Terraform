provider "aws" {
    region = "us-east-1"
}

module "db_server" {
    source = "./db"
    instance_db_name = "DB Server"
}

module "web_server" {
    source = "./web"
    instance_web_name = "Web Server"
    instance_sec_name = module.sg.sg_name_id_out
    
}

module "eip" {
    source = "./eip"
    instance_web_id = module.web_server.instance_web_id

}

module "sg" {
    source = "./sg"
    sg_name_id = "web_sg"
}