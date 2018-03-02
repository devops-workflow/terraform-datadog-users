module "disabled" {
  source  = "../"
  enabled = false

  users = [
    "name,email,user2,user2@example.com",
  ]
}

module "users" {
  source = "../"

  users = [
    "name,handle,user1,user1@example.com",
    "name,handle,admin,disabled,admin1,admin1@example.com,true,false",
    "name,handle,email,disabled,role,dis1,dis1@example.com,disy1@example.com,false,ro",
  ]
}

output "disabled" {
  description = "List of user disabled status"
  value       = "${module.users.disabled}"
}

output "ids" {
  description = "List of user IDs"
  value       = "${module.users.ids}"
}

output "verified" {
  description = "List of user verified status"
  value       = "${module.users.verified}"
}

output "admins" {
  value = "${module.users.admins}"
}

output "emails" {
  value = "${module.users.emails}"
}

output "handles" {
  value = "${module.users.handles}"
}

output "names" {
  value = "${module.users.names}"
}

output "roles" {
  value = "${module.users.roles}"
}

output "users" {
  value = "${module.users.users}"
}
