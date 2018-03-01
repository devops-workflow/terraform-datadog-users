module "users" {
  source = "../"

  users = [
    "name,email,user1,user1@example.com",
    "name,email,admin,disabled,admin1,admin1@example.com,true,false",
    "name,email,disabled,dis1,dis1@example.com,true",
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

output "names" {
  value = "${module.users.names}"
}

output "users" {
  value = "${module.users.users}"
}
