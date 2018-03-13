output "disabled" {
  description = "List of user disabled status"
  value       = "${module.disabled.disabled}"
}

output "ids" {
  description = "List of user IDs"
  value       = "${module.disabled.ids}"
}

output "verified" {
  description = "List of user verified status"
  value       = "${module.disabled.verified}"
}

output "emails" {
  value = "${module.disabled.emails}"
}

output "handles" {
  value = "${module.disabled.handles}"
}

output "names" {
  value = "${module.disabled.names}"
}

output "users" {
  value = "${module.disabled.users}"
}
