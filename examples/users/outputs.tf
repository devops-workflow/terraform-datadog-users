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

output "emails" {
  value = "${module.users.emails}"
}

output "handles" {
  value = "${module.users.handles}"
}

output "names" {
  value = "${module.users.names}"
}

output "users" {
  value = "${module.users.users}"
}
