output "disabled" {
  description = "List of user disabled status"
  value       = "${compact(concat(datadog_user.users.*.disabled, list("")))}"
}

output "ids" {
  description = "List of user IDs"
  value       = "${compact(concat(datadog_user.users.*.id, list("")))}"
}

output "verified" {
  description = "List of user verified status"
  value       = "${compact(concat(datadog_user.users.*.verified, list("")))}"
}

output "admins" {
  value = "${compact(concat(null_resource.users.*.triggers.admin, list("")))}"
}

output "emails" {
  value = "${compact(concat(null_resource.users.*.triggers.email, list("")))}"
}

output "handles" {
  value = "${compact(concat(null_resource.users.*.triggers.handle, list("")))}"
}

output "names" {
  value = "${compact(concat(null_resource.users.*.triggers.name, list("")))}"
}

output "roles" {
  value = "${compact(concat(null_resource.users.*.triggers.role, list("")))}"
}

output "users" {
  value = "${var.users}"
}
