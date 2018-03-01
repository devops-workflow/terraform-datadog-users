output "disabled" {
  description = "List of user disabled status"
  value       = "${datadog_user.users.*.disabled}"
}

output "ids" {
  description = "List of user IDs"
  value       = "${datadog_user.users.*.id}"
}

output "verified" {
  description = "List of user verified status"
  value       = "${datadog_user.users.*.verified}"
}

output "admins" {
  value = "${null_resource.users.*.triggers.admin}"
}

output "emails" {
  value = "${null_resource.users.*.triggers.email}"
}

output "names" {
  value = "${null_resource.users.*.triggers.name}"
}

output "users" {
  value = "${var.users}"
}
