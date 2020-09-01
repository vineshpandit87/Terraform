
output "SG_ID" {
  value = module.sg.sg_name_id
}

output "EC2_DB_ID" {
  value = module.db.db_server_name
}

output "EC2_WEB_ID" {
  value = module.web.instance_web_id
}

output "EC2_EIP" {
  value = module.eip.instance_web_ip
}

