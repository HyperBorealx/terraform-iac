# Archive source code for each function
data "archive_file" "function_zip" {
  for_each = var.functions

  type        = "zip"
  source_dir  = each.value.source_dir
  output_path = "${path.module}/.terraform/tmp/${each.key}.zip"
}

module "lambda_edge_functions" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 7.0"

  for_each = var.functions

  function_name = each.value.function_name
  description   = try(each.value.description, "Lambda@Edge function")
  handler       = each.value.handler
  runtime       = each.value.runtime

  # Lambda@Edge specific configuration
  publish        = true
  lambda_at_edge = true

  # Source code configuration
  create_package         = false
  local_existing_package = data.archive_file.function_zip[each.key].output_path

  # Lambda@Edge constraints
  memory_size = each.value.memory_size
  timeout     = each.value.timeout

  # Concurrency configuration
  reserved_concurrent_executions = each.value.reserved_concurrent_executions

  # Lambda@Edge doesn't support environment variables or VPC
  environment_variables  = {}
  vpc_subnet_ids         = []
  vpc_security_group_ids = []

  # CloudWatch logs configuration
  cloudwatch_logs_retention_in_days = var.log_retention_days

  # IAM role configuration
  create_role = each.value.create_role
  lambda_role = each.value.create_role ? null : each.value.lambda_role
  role_name   = each.value.create_role ? try(each.value.role_name, "${each.value.function_name}-role") : null

  # Only set IAM policy configurations when creating role
  attach_policy_json = each.value.create_role ? each.value.attach_policy_json : false
  policy_json        = each.value.create_role ? each.value.policy_json : null

  # Only set trusted_entities when creating a role
  trusted_entities = each.value.create_role ? [
    "lambda.amazonaws.com",
    "edgelambda.amazonaws.com"
  ] : []

  tags = merge(
    var.tags,
    each.value.tags,
    {
      TerraformTrack = trim(
        replace(
          path.cwd,
          regexall("^.*/live/", path.cwd)[0],
          ""
        ),
        "/"
      )
      EventType = each.value.event_type
      Name      = each.value.function_name  # Required for SCP
    }
  )
}

# Data source to validate region
data "aws_region" "current" {}

# Validation - must be in us-east-1
resource "null_resource" "validate_region" {
  count = data.aws_region.current.name == "us-east-1" ? 0 : 1

  provisioner "local-exec" {
    command = "echo 'ERROR: Lambda@Edge functions must be deployed in us-east-1 region. Current region: ${data.aws_region.current.name}' && exit 1"
  }
}