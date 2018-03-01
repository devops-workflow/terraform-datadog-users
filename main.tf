# terraform-datadog-users

# https://www.terraform.io/docs/providers/datadog/r/user.html

module "enabled" {
  source  = "devops-workflow/boolean/local"
  version = "0.1.1"
  value   = "${var.enabled}"
}

resource "null_resource" "users" {
  count = "${module.enabled.value ? length(var.users) : 0}"

  triggers {
    name = "${lookup(zipmap(
      slice(split(",",element(var.users, count.index)), 0, length(split(",",element(var.users, count.index)))/2),
      slice(split(",",element(var.users, count.index)),
         length(split(",",element(var.users, count.index))) / 2,
         length(split(",",element(var.users, count.index))))
      ), "name")}"

    email = "${lookup(zipmap(
      slice(split(",",element(var.users, count.index)), 0, length(split(",",element(var.users, count.index)))/2),
      slice(split(",",element(var.users, count.index)),
         length(split(",",element(var.users, count.index))) / 2,
         length(split(",",element(var.users, count.index))))
      ), "email")}"

    admin = "${lookup(zipmap(
      slice(split(",",element(var.users, count.index)), 0, length(split(",",element(var.users, count.index)))/2),
      slice(split(",",element(var.users, count.index)),
         length(split(",",element(var.users, count.index))) / 2,
         length(split(",",element(var.users, count.index))))
      ), "admin", "false")}"

    disabled = "${lookup(zipmap(
      slice(split(",",element(var.users, count.index)), 0, length(split(",",element(var.users, count.index)))/2),
      slice(split(",",element(var.users, count.index)),
         length(split(",",element(var.users, count.index))) / 2,
         length(split(",",element(var.users, count.index))))
      ), "disabled", "false")}"
  }
}

resource "datadog_user" "users" {
  count    = "${module.enabled.value ? length(var.users) : 0}"
  email    = "${element(null_resource.users.*.triggers.email, count.index)}"
  handle   = "${element(null_resource.users.*.triggers.email, count.index)}"
  name     = "${element(null_resource.users.*.triggers.name, count.index)}"
  is_admin = "${element(null_resource.users.*.triggers.admin, count.index)}"
  disabled = "${element(null_resource.users.*.triggers.disabled, count.index)}"

  #role =
}
