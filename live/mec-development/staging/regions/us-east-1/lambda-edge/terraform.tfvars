log_retention_days = 14

# Lambda@Edge functions config
functions = {
  staging-viewer-request = {
    function_name = "phoenix-test-staging-viewer-request-lambda-edge"
    description   = "Handle viewer requests for staging environment"
    runtime      = "nodejs20.x"
    handler      = "index.handler"
    source_dir   = "./src/viewer-request"
    event_type   = "viewer-request"
    memory_size  = 128
    timeout      = 5

    # Create new role for new functions
    create_role = true
    lambda_role = "phoenix-test-staging-viewer-request-lambda-edge-role"

  }

  # imported function
  staging2-mdquip-viewer-response = {
    function_name = "phoenix-staging2-mdquip-viewer-response-lambda-edge"
    description   = "phoenix staging2 mdquip viewer-response lambda@edge"
    runtime      = "nodejs18.x"
    handler      = "index.handler"
    source_dir   = "./src/staging2-mdquip-viewer-response"
    event_type   = "viewer-response"
    memory_size  = 128
    timeout      = 3

    # Use existing role
    create_role = false
    lambda_role = "arn:aws:iam::205551755912:role/phoenix-staging2-mdquip-lambda-edge-role"

    # Preserve existing concurrency limit of 1
    reserved_concurrent_executions = 1

    tags = {
      BusinessGroup = "PhysicianApps",
      Environment = "staging2"
    }
  }
}