variable "functions" {
  description = "Map of Lambda@Edge functions to create"
  type        = any
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "log_retention_days" {
  description = "Number of days to retain CloudWatch logs"
  type        = number
  default     = 14
}

module "lambda_edge_functions" {
  source = "../../../../../../_modules/lambda-edge"

  functions          = var.functions
  tags              = var.tags
  log_retention_days = var.log_retention_days
}


# Outputs for use by CloudFront distributions
output "function_qualified_arns" {
  description = "Map of function names to qualified ARNs for CloudFront use"
  value       = module.lambda_edge_functions.function_qualified_arns
}

output "function_arns" {
  description = "Map of function names to ARNs (without version)"
  value       = module.lambda_edge_functions.function_arns
}

output "function_names" {
  description = "Map of function logical names to actual function names"
  value       = module.lambda_edge_functions.function_names
}

output "function_versions" {
  description = "Map of function names to their latest published version"
  value       = module.lambda_edge_functions.function_versions
}