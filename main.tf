# terraform-datadog-users

# https://www.terraform.io/docs/providers/datadog/r/user.html

module "enabled" {
  source  = "devops-workflow/boolean/local"
  version = "0.1.1"
  value   = "${var.enabled}"
}

data "null_data_source" "this" {
  count = "${module.enabled.value ? length(var.users) : 0}"

  inputs {
    handle = "${lookup(var.users[count.index], "handle")}"
    email  = "${lookup(var.users[count.index], "email", lookup(var.users[count.index], "handle"))}"
    name   = "${lookup(var.users[count.index], "name")}"
  }
}

resource "datadog_user" "this" {
  count    = "${module.enabled.value ? length(var.users) : 0}"
  disabled = "${lookup(var.users[count.index], "disabled", false)}"
  email    = "${lookup(var.users[count.index], "email", lookup(var.users[count.index], "handle"))}"
  handle   = "${lookup(var.users[count.index], "handle")}"
  is_admin = "${lookup(var.users[count.index], "is_admin", false)}"
  name     = "${lookup(var.users[count.index], "name")}"
  role     = "${lookup(var.users[count.index], "role", "st")}"
}
