output "function_qualified_arns" {
  description = "Map of function names to qualified ARNs (with version) for CloudFront use"
  value = {
    for k, func in module.lambda_edge_functions : k => func.lambda_function_qualified_arn
  }
}

output "function_arns" {
  description = "Map of function names to ARNs (without version)"
  value = {
    for k, func in module.lambda_edge_functions : k => func.lambda_function_arn
  }
}

output "function_names" {
  description = "Map of function logical names to actual function names"
  value = {
    for k, func in module.lambda_edge_functions : k => func.lambda_function_name
  }
}

output "function_versions" {
  description = "Map of function names to their latest published version"
  value = {
    for k, func in module.lambda_edge_functions : k => func.lambda_function_version
  }
}

output "function_invoke_arns" {
  description = "Map of function names to invoke ARNs"
  value = {
    for k, func in module.lambda_edge_functions : k => func.lambda_function_invoke_arn
  }
}

output "iam_role_arns" {
  description = "Map of function names to their IAM role ARNs"
  value = {
    for k, func in module.lambda_edge_functions : k => func.lambda_role_arn
  }
}

output "cloudwatch_log_group_names" {
  description = "Map of function names to their CloudWatch log group names"
  value = {
    for k, func in module.lambda_edge_functions : k => func.lambda_cloudwatch_log_group_name
  }
}