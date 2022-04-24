locals {
  workspace  = terraform.workspace
  account_id = data.aws_caller_identity.current_caller_identity.account_id
}

data "aws_caller_identity" "current_caller_identity" {
}

output "workspace" {
  value = local.workspace
}

output "account_id" {
  value = local.account_id
}
