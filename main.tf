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

    email = "${lookup(zipmap(
      slice(split(",",element(var.users, count.index)), 0, length(split(",",element(var.users, count.index)))/2),
      slice(split(",",element(var.users, count.index)),
         length(split(",",element(var.users, count.index))) / 2,
         length(split(",",element(var.users, count.index))))
      ), "email",
      lookup(zipmap(
        slice(split(",",element(var.users, count.index)), 0, length(split(",",element(var.users, count.index)))/2),
        slice(split(",",element(var.users, count.index)),
           length(split(",",element(var.users, count.index))) / 2,
           length(split(",",element(var.users, count.index))))
        ), "handle")
    )}"

    handle = "${lookup(zipmap(
      slice(split(",",element(var.users, count.index)), 0, length(split(",",element(var.users, count.index)))/2),
      slice(split(",",element(var.users, count.index)),
         length(split(",",element(var.users, count.index))) / 2,
         length(split(",",element(var.users, count.index))))
      ), "handle")}"

    role = "${lookup(zipmap(
      slice(split(",",element(var.users, count.index)), 0, length(split(",",element(var.users, count.index)))/2),
      slice(split(",",element(var.users, count.index)),
         length(split(",",element(var.users, count.index))) / 2,
         length(split(",",element(var.users, count.index))))
      ), "role", "st")}"

  }
}

resource "datadog_user" "users" {
  count    = "${module.enabled.value ? length(var.users) : 0}"
  disabled = "${element(null_resource.users.*.triggers.disabled, count.index)}"
  email    = "${element(null_resource.users.*.triggers.email, count.index)}"
  handle   = "${element(null_resource.users.*.triggers.handle, count.index)}"
  is_admin = "${element(null_resource.users.*.triggers.admin, count.index)}"
  name     = "${element(null_resource.users.*.triggers.name, count.index)}"
  role     = "${element(null_resource.users.*.triggers.role, count.index)}"
}
