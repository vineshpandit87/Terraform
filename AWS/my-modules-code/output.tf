
output "SG_ID" {
  value = module.sg.sg_name_id_out
}

output "EC2_DB_ID" {
  value = module.db_server.db_server_name
}

output "EC2_WEB_ID" {
  value = module.web_server.instance_web_out
}

output "EC2_EIP" {
  value = module.eip.instance_web_ip
}

