module "users" {
  source = "../../"

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
      disabled = "false"
      role     = "ro"
    },
  ]
}
