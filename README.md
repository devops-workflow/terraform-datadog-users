[![CircleCI](https://circleci.com/gh/devops-workflow/terraform-datadog-users.svg?style=svg)](https://circleci.com/gh/devops-workflow/terraform-datadog-users)

terraform-datadog-users
=======================

Terraform module for managing Datadog users

This module simulates a list of maps data structure. Can serve as an example
for anyone that needed that.

```hcl
module "datadog-users" {
  source  = "devops-workflow/users/datadog"
  version = "0.0.1"

  users = [
    "name,email,user1,user1@example.com",
    "name,email,user2,user2@example.com",
    "name,email,admin,disabled,admin1,admin1@example.com,true,false",
    "name,email,disabled,dis1,dis1@example.com,true",
    "name,email,admin,admin2,admin2@example.com,true",
  ]
}
```

User data structure is a list of strings that represent maps.
Each string is a comma separated list of key names followed by values.
`name` and `email` are required fields, Other fields are optional.
