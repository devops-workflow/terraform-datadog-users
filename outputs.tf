output "disabled" {
  description = "List of user disabled status"
  value       = "${compact(concat(datadog_user.this.*.disabled, list("")))}"
}

output "ids" {
  description = "List of user IDs"
  value       = "${compact(concat(datadog_user.this.*.id, list("")))}"
}

output "verified" {
  description = "List of user verified status"
  value       = "${compact(concat(datadog_user.this.*.verified, list("")))}"
}

output "emails" {
  description = "List of user emails"
  value       = "${compact(concat(data.null_data_source.this.*.outputs.email, list("")))}"
}

output "handles" {
  description = "List of user handles"
  value       = "${compact(concat(data.null_data_source.this.*.outputs.handle, list("")))}"
}

output "names" {
  description = "List of user names"
  value       = "${compact(concat(data.null_data_source.this.*.outputs.name, list("")))}"
}

output "users" {
  value = "${var.users}"
}
