[![CircleCI](https://circleci.com/gh/devops-workflow/terraform-datadog-users.svg?style=svg)](https://circleci.com/gh/devops-workflow/terraform-datadog-users)

terraform-datadog-users
=======================

Terraform module for managing Datadog users

```hcl
module "datadog-users" {
  source  = "devops-workflow/users/datadog"
  version = "1.0.0"

  users = [
    {
      name   = "user1"
      handle = "user1@example.com"
    },
    {
      name     = "admin1"
      handle   = "admin1@example.com"
      admin    = "true"
      disabled = "false"
    },
    {
      name     = "dis1"
      handle   = "dis1@example.com"
      email    = "disy1@example.com"
      disabled = "true"
      role     = "ro"
    },
  ]
}
```

User data structure is a list of maps.

#### User field mappings

| User Field |  Default  | Datadog Provider Field | Description |
|:-----------|:---------:|:-----------------------|:------------|
| admin      | `false`   | is_admin  | Make user an admin? |
| disabled   | `false`   | disabled  | Disable user |
| email      | `handle`  | email     | User email. Needed when user's email changed after account creation. Will default to `handle` if not provided |
| handle     | __REQUIRED__ | handle | email handle of user |
| name       | __REQUIRED__ | name   | User name |
| role       | `st`      | role      | User role. Options are `st` standard, `adm` admin, `ro` read-only |
