# CloudFront Distribution Configuration - MEC Development Staging
# TEST PHASE: These are test distributions to validate PSL CloudFront module

distributions = {
  # TEST 1: New distribution pattern test
  test-new-distribution = {
    comment         = "TEST: New distribution using PSL CloudFront module"
    enabled         = true
    is_ipv6_enabled = true
    price_class     = "PriceClass_100"
    retain_on_delete = false
    wait_for_deployment = false

    # Required: Origins configuration
    origin = {
      s3-test-origin = {
        domain_name = "psl-test-cloudfront-mec.s3.amazonaws.com"
        origin_id   = "S3-psl-test-mec"
        origin_path = ""

        # S3 origin configuration
        s3_origin_config = {
          origin_access_identity = ""
        }

        # Custom headers (empty but defined)
        custom_headers = []
      }
    }

    # Required: Default cache behavior
    default_cache_behavior = {
      target_origin_id       = "S3-psl-test-mec"
      viewer_protocol_policy = "redirect-to-https"
      allowed_methods        = ["GET", "HEAD", "OPTIONS"]
      cached_methods         = ["GET", "HEAD"]
      compress               = true

      # Use cache policy instead of legacy forwarding
      cache_policy_id          = "658327ea-f89d-4fab-a63d-7e88639e58f6"
      origin_request_policy_id = "88a5eaf4-2fd4-4709-b370-b4c650ea3fcf"
    }

    # Required: Viewer certificate
    viewer_certificate = {
      cloudfront_default_certificate = true
      minimum_protocol_version       = "TLSv1.2_2021"
    }

    # Tags
    tags = {
      Account       = "mec-development"
      Environment   = "staging"
      Purpose       = "test-new-distribution"
      Owner         = "DevOps"
      DRI           = "DevOps"
      SLALevel      = "Tier3"
      BusinessGroup = "DevOps"
      TestPhase     = "module-validation"
    }
  }

  # TEST 2: Phoenix MEC Staging pattern
  test-phoenix-mec-pattern = {
    comment         = "TEST: Configuration matching phoenix-mec-staging pattern"
    enabled         = true
    is_ipv6_enabled = true
    price_class     = "PriceClass_All"
    retain_on_delete = false
    wait_for_deployment = false

    # Origins configuration
    origin = {
      phoenix-mec-staging = {
        domain_name = "phoenix-mec-staging.s3.amazonaws.com"
        origin_id   = "S3-phoenix-mec-staging"
        origin_path = ""

        # S3 origin configuration
        s3_origin_config = {
          origin_access_identity = ""
        }

        # Custom headers (empty but defined)
        custom_headers = []
      }
    }

    # Default cache behavior
    default_cache_behavior = {
      target_origin_id       = "S3-phoenix-mec-staging"
      viewer_protocol_policy = "allow-all"
      allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
      cached_methods         = ["GET", "HEAD"]
      compress               = true

      # Legacy forwarding (for compatibility with existing)
      query_string = true
      cookies = {
        forward = "all"
      }
      headers = ["*"]
    }

    # Ordered cache behaviors for different paths
    ordered_cache_behavior = [
      {
        path_pattern           = "/api/*"
        target_origin_id       = "S3-phoenix-mec-staging"
        viewer_protocol_policy = "https-only"
        allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
        cached_methods         = ["GET", "HEAD"]
        compress               = false

        # Use caching disabled policy for API
        cache_policy_id = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
      },
      {
        path_pattern           = "/static/*"
        target_origin_id       = "S3-phoenix-mec-staging"
        viewer_protocol_policy = "redirect-to-https"
        allowed_methods        = ["GET", "HEAD", "OPTIONS"]
        cached_methods         = ["GET", "HEAD"]
        compress               = true

        # Use caching optimized policy for static assets
        cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
      }
    ]

    # Custom error responses for SPA
    custom_error_response = [
      {
        error_code         = 403
        response_code      = 200
        response_page_path = "/index.html"
      },
      {
        error_code         = 404
        response_code      = 200
        response_page_path = "/index.html"
      }
    ]

    # Viewer certificate
    viewer_certificate = {
      cloudfront_default_certificate = true
      minimum_protocol_version       = "TLSv1.2_2021"
    }

    # Tags
    tags = {
      Account       = "mec-development"
      Environment   = "staging"
      Purpose       = "test-import-pattern"
      Owner         = "DevOps"
      DRI           = "DevOps"
      SLALevel      = "Tier3"
      BusinessGroup = "DevOps"
      TestPhase     = "import-validation"
      Pattern       = "phoenix-mec-staging"
    }
  }
}