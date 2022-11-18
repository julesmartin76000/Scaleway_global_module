provider "scaleway" {
  organization_id = "d18f7ea1-5c74-4c62-804b-dd789da4466d"
}


data "scaleway_account_project" "default" {
  name = "default"
}

resource "scaleway_iam_application" "CI-Deploy" {
  name = "CI-Deploy"
}

resource "scaleway_iam_policy" "object_read_only" {
  name        = "Devops Group"
  description = "Gives the rights for the devops group to read bucket Object & Full access on CaaS"
  rule {
    project_ids          = [data.scaleway_account_project.default.id]
    permission_set_names = ["ObjectStorageReadOnly", "ContainersFullAccess"]
  }
}

locals {
  users = toset([
    "monique@scaleway.com"
  ])
}

data "scaleway_iam_user" "users" {
  for_each = local.users
  email    = each.value
}

resource "scaleway_iam_group" "with_users" {
  name = "iam_group_with_app"
  #application_ids = []
  user_ids = [for user in data.scaleway_iam_user.users : user.id]
}
