data "aws_caller_identity" "this" {}

locals {
  root_statement = {
    Sid       = "EnableIAMUserPermissions"
    Effect    = "Allow"
    Principal = {
      AWS = "arn:aws:iam::${data.aws_caller_identity.this.account_id}:root"
    }
    Action    = "kms:*"
    Resource  = "*"
  }

  use_statement_base = {
    Action   = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
    ]
    Effect   = "Allow"
    Resource = "*"
  }

  role_statement = {
    for k, spec in var.keys : k => merge(
      local.use_statement_base,

      length(spec.allowed_iam_roles) > 0 ? { Principal = { AWS = spec.allowed_iam_roles } } : {},

      { Sid = "roles" }
    )
  }

  conditions_statement = {
    for k, spec in var.keys : k => merge(
      local.use_statement_base,
      { Principal = { AWS = "arn:aws:iam::${data.aws_caller_identity.this.account_id}:root" } },
      length(spec.allowed_iam_role_patterns) > 0
        ? {
            Condition = {
              ArnLike = {
                "aws:PrincipalArn" = spec.allowed_iam_role_patterns
              }
            }
          }
        : {},

      { Sid = "conditions" }
    )
  }

  default_policies = {
    for k, spec in var.keys : k => {
      Version   = "2012-10-17"
      Statement = [
        local.root_statement,
        local.role_statement[k],
        local.conditions_statement[k],
      ]
    }
  }

  _alias_tuples = flatten([
    for k, spec in var.keys : [
      for a in spec.aliases : {
        map_key = "${k}-${replace(a, "alias/", "")}"
        key     = k
        alias   = a
      }
    ]
  ])

  alias_map = {
    for tuple in local._alias_tuples :
    tuple.map_key => {
      key   = tuple.key
      alias = tuple.alias
    }
  }
}

resource "aws_kms_key" "this" {
  for_each = var.keys

  description             = each.value.description
  enable_key_rotation     = each.value.enable_key_rotation
  deletion_window_in_days = each.value.deletion_window_in_days
  tags                    = each.value.tags

  policy = length(trimspace(each.value.key_policy)) > 0 ? each.value.key_policy : jsonencode(local.default_policies[each.key])
}

resource "aws_kms_alias" "this" {
  for_each = local.alias_map

  name          = each.value.alias
  target_key_id = aws_kms_key.this[each.value.key].key_id
}
