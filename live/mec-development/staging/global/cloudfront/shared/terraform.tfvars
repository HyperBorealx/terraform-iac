# CloudFront Distribution Configuration - MEC Development Staging

distributions = {
  # TEST 1: S3 distribution with cache policies (modern approach)
  test-new-distribution = {
    # Basic distribution settings
    aliases                     = []
    comment                     = "TEST: S3 with cache policies (modern)"
    enabled                     = true
    is_ipv6_enabled            = true
    price_class                = "PriceClass_100"
    retain_on_delete           = false
    wait_for_deployment        = false

    # Origins configuration
    origin = {
      s3-test-origin = {
        domain_name = "psl-test-cloudfront-mec.s3.eu-west-1.amazonaws.com"
        origin_id   = "S3-psl-test-mec"
        origin_path = ""
        custom_headers = []
      }
    }

    # Default cache behavior - MODERN APPROACH (cache policies only)
    default_cache_behavior = {
      target_origin_id       = "S3-psl-test-mec"
      viewer_protocol_policy = "redirect-to-https"
      allowed_methods        = ["GET", "HEAD", "OPTIONS"]
      cached_methods         = ["GET", "HEAD"]
      compress               = true

      # Use cache policies (modern) - NO forwarded_values
      cache_policy_id          = "658327ea-f89d-4fab-a63d-7e88639e58f6"
      origin_request_policy_id = "88a5eaf4-2fd4-4709-b370-b4c650ea3fcf"

      # DO NOT specify forwarded_values when using cache policies
    }

    # Optional configurations
    ordered_cache_behavior = []
    custom_error_response = [
      {
        error_code         = 404
        response_code      = 404
        response_page_path = ""
        error_caching_min_ttl = 300
      }
    ]
    geo_restriction           = {}
    logging_config            = {}

    # Viewer certificate
    viewer_certificate = {
      cloudfront_default_certificate = true
      minimum_protocol_version       = "TLSv1.2_2021"
    }

    # Use Origin Access Control (OAC)
    create_origin_access_control = true
    origin_access_control = {
      s3_oac = {
        description      = "CloudFront access to S3"
        origin_type      = "s3"
        signing_behavior = "always"
        signing_protocol = "sigv4"
      }
    }

    create_origin_access_identity = false
    origin_access_identities     = {}
    create_monitoring_subscription        = false
    realtime_metrics_subscription_status = "Enabled"

    tags = {
      Account       = "mec-development"
      Environment   = "staging"
      Purpose       = "test-cache-policies"
      Owner         = "DevOps"
      DRI           = "DevOps"
      SLALevel      = "Tier3"
      BusinessGroup = "DevOps"
      TestPhase     = "module-validation"
    }
  }

  # TEST 2: S3 distribution with forwarded values (legacy approach)
  test-s3-legacy = {
    # Basic distribution settings
    aliases                     = []
    comment                     = "TEST: S3 with forwarded values (legacy)"
    enabled                     = true
    is_ipv6_enabled            = true
    price_class                = "PriceClass_100"
    retain_on_delete           = false
    wait_for_deployment        = false

    # Origins configuration
    origin = {
      s3-legacy-origin = {
        domain_name = "psl-test-cloudfront-mec.s3.eu-west-1.amazonaws.com"
        origin_id   = "S3-Legacy-Origin"
        origin_path = ""

        # S3 origin configuration with OAI
        s3_origin_config = {
          origin_access_identity = "s3_bucket_oai"
        }

        custom_headers = []
      }
    }

    # Default cache behavior - LEGACY APPROACH (forwarded values only)
    default_cache_behavior = {
      target_origin_id       = "S3-Legacy-Origin"
      viewer_protocol_policy = "redirect-to-https"
      allowed_methods        = ["GET", "HEAD", "OPTIONS"]
      cached_methods         = ["GET", "HEAD"]
      compress               = true

      # Use forwarded values (legacy) - NO cache policies
      forwarded_values = {
        query_string = false
        cookies = {
          forward = "none"
        }
        headers = []
      }

      # DO NOT specify cache_policy_id when using forwarded_values
    }

    # Optional configurations
    ordered_cache_behavior = []
    custom_error_response = [
      {
        error_code         = 404
        response_code      = 404
        response_page_path = ""
        error_caching_min_ttl = 300
      }
    ]
    geo_restriction           = {}
    logging_config            = {}

    # Viewer certificate
    viewer_certificate = {
      cloudfront_default_certificate = true
      minimum_protocol_version       = "TLSv1.2_2021"
    }

    # Use Origin Access Identity (OAI)
    create_origin_access_control = false
    origin_access_control       = {}
    create_origin_access_identity = true
    origin_access_identities = {
      s3_bucket_oai = "S3 bucket access via OAI"
    }

    create_monitoring_subscription        = false
    realtime_metrics_subscription_status = "Enabled"

    tags = {
      Account       = "mec-development"
      Environment   = "staging"
      Purpose       = "test-forwarded-values"
      Owner         = "DevOps"
      DRI           = "DevOps"
      SLALevel      = "Tier3"
      BusinessGroup = "DevOps"
      TestPhase     = "module-validation"
    }
  }

  # TEST 3: Custom origin with forwarded values
  test-custom-origin = {
    # Basic distribution settings
    aliases                     = []
    comment                     = "TEST: Custom origin"
    enabled                     = true
    is_ipv6_enabled            = true
    price_class                = "PriceClass_100"
    retain_on_delete           = false
    wait_for_deployment        = false

    # Origins configuration
    origin = {
      api-origin = {
        domain_name = "httpbin.org"
        origin_id   = "Custom-API-Origin"
        origin_path = ""

        custom_origin_config = {
          http_port              = 80
          https_port             = 443
          origin_protocol_policy = "https-only"
          origin_ssl_protocols   = ["TLSv1.2"]
          origin_keepalive_timeout = 5
          origin_read_timeout    = 30
        }

        custom_headers = []
      }
    }

    # Default cache behavior - CUSTOM ORIGIN (forwarded values)
    default_cache_behavior = {
      target_origin_id       = "Custom-API-Origin"
      viewer_protocol_policy = "redirect-to-https"
      allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
      cached_methods         = ["GET", "HEAD"]
      compress               = true

      # Use forwarded values for custom origins
      forwarded_values = {
        query_string = true
        cookies = {
          forward = "none"
        }
        headers = ["Authorization", "CloudFront-Forwarded-Proto"]
      }
    }

    # Simple ordered cache behavior
    ordered_cache_behavior = [
      {
        path_pattern           = "/api/*"
        target_origin_id       = "Custom-API-Origin"
        viewer_protocol_policy = "https-only"
        allowed_methods        = ["GET", "HEAD", "OPTIONS"]
        cached_methods         = ["GET", "HEAD"]
        compress               = false

        forwarded_values = {
          query_string = true
          cookies = {
            forward = "none"
          }
          headers = ["*"]
        }
      }
    ]

    # Custom error responses
    custom_error_response = [
      {
        error_code         = 404
        response_code      = 404
        response_page_path = ""
        error_caching_min_ttl = 300
      }
    ]

    geo_restriction = {
      restriction_type = "none"
      locations        = []
    }

    logging_config = {}

    viewer_certificate = {
      cloudfront_default_certificate = true
      minimum_protocol_version       = "TLSv1.2_2021"
    }

    # No S3 settings for custom origins
    create_origin_access_control = false
    origin_access_control       = {}
    create_origin_access_identity = false
    origin_access_identities     = {}

    create_monitoring_subscription        = false
    realtime_metrics_subscription_status = "Enabled"

    tags = {
      Account       = "mec-development"
      Environment   = "staging"
      Purpose       = "test-custom-origin"
      Owner         = "DevOps"
      DRI           = "DevOps"
      SLALevel      = "Tier3"
      BusinessGroup = "DevOps"
      TestPhase     = "module-validation"
    }
  }
}