distributions = {
  # test distribution with cache policies
  "test-cache-policies" = {
    aliases         = []
    comment         = "TEST: Cache policies validation"
    enabled         = true
    is_ipv6_enabled = true
    price_class     = "PriceClass_100"
    retain_on_delete = false
    wait_for_deployment = false

    origin = {
      s3-test = {
        domain_name = "psl-test-cloudfront-mec.s3.eu-west-1.amazonaws.com"
        origin_id   = "S3-Test-Origin"
      }
    }

    default_cache_behavior = {
      target_origin_id       = "S3-Test-Origin"
      viewer_protocol_policy = "redirect-to-https"
      allowed_methods        = ["GET", "HEAD", "OPTIONS"]
      cached_methods         = ["GET", "HEAD"]
      compress               = true
      cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
      use_forwarded_values   = false
    }

    ordered_cache_behavior = []
    custom_error_response  = []

    geo_restriction = {
      restriction_type = "none"
      locations        = []
    }

    viewer_certificate = {
      cloudfront_default_certificate = true
      minimum_protocol_version       = "TLSv1.2_2021"
    }

    create_origin_access_control = true
    origin_access_control = {
      test_oac = {
        description      = "Test OAC for S3"
        origin_type      = "s3"
        signing_behavior = "always"
        signing_protocol = "sigv4"
      }
    }

    tags = {
      Account       = "mec-development"
      Environment   = "staging"
      Purpose       = "test-validation"
      Owner         = "DevOps"
      TestPhase     = "module-validation"
    }
  }

  # test distribution with forwarded values
  "test-legacy-forwarded" = {
    aliases         = []
    comment         = "TEST: Legacy forwarded values"
    enabled         = true
    is_ipv6_enabled = true
    price_class     = "PriceClass_100"
    retain_on_delete = false
    wait_for_deployment = false

    origin = {
      api-origin = {
        domain_name = "httpbin.org"
        origin_id   = "Custom-API-Origin"

        custom_origin_config = {
          http_port              = 80
          https_port             = 443
          origin_protocol_policy = "https-only"
          origin_ssl_protocols   = ["TLSv1.2"]
        }
      }
    }

    default_cache_behavior = {
      target_origin_id       = "Custom-API-Origin"
      viewer_protocol_policy = "redirect-to-https"
      allowed_methods        = ["GET", "HEAD", "OPTIONS"]
      cached_methods         = ["GET", "HEAD"]
      compress               = true
      use_forwarded_values   = true
      query_string           = true
      headers                = ["Authorization"]
      cookies_forward        = "none"
    }

    ordered_cache_behavior = []
    custom_error_response  = []

    geo_restriction = {
      restriction_type = "none"
      locations        = []
    }

    viewer_certificate = {
      cloudfront_default_certificate = true
      minimum_protocol_version       = "TLSv1.2_2021"
    }

    create_origin_access_control = false
    create_origin_access_identity = false

    tags = {
      Account       = "mec-development"
      Environment   = "staging"
      Purpose       = "test-forwarded-values"
      Owner         = "DevOps"
      TestPhase     = "legacy-validation"
    }
  }
    # Lambda@Edge test distribution
  "test-lambda-edge" = {
    aliases         = []
    comment         = "TEST: Lambda@Edge integration"
    enabled         = true
    is_ipv6_enabled = true
    price_class     = "PriceClass_100"
    retain_on_delete = false
    wait_for_deployment = false

    origin = {
      s3-origin = {
        domain_name = "psl-test-cloudfront-mec.s3.eu-west-1.amazonaws.com"
        origin_id   = "S3-Lambda-Origin"
      }
    }

    default_cache_behavior = {
      target_origin_id       = "S3-Lambda-Origin"
      viewer_protocol_policy = "redirect-to-https"
      allowed_methods        = ["GET", "HEAD", "OPTIONS"]
      cached_methods         = ["GET", "HEAD"]
      compress               = true
      cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
      use_forwarded_values   = false

      # Lambda@Edge configuration
      lambda_function_association = {
        origin-request = {
          lambda_arn = "arn:aws:lambda:us-east-1:205551755912:function:phoenix-develop-peervoicecurricula-origin-request-lambda-edge:32"
          include_body = false
        }
      }
    }

    ordered_cache_behavior = []
    custom_error_response  = []

    geo_restriction = {
      restriction_type = "none"
      locations        = []
    }

    viewer_certificate = {
      cloudfront_default_certificate = true
      minimum_protocol_version       = "TLSv1.2_2021"
    }

    create_origin_access_control = true
    origin_access_control = {
      lambda_oac = {
        description      = "Lambda@Edge OAC for S3"
        origin_type      = "s3"
        signing_behavior = "always"
        signing_protocol = "sigv4"
      }
    }

    tags = {
      Account     = "mec-development"
      Environment = "staging"
      Purpose     = "test-lambda-edge"
      Owner       = "DevOps"
      TestPhase   = "lambda-edge-validation"
    }
  }
    # ACM Certificate test distribution
  "test-custom-ssl" = {
    aliases         = []  # Your custom domain
    comment         = "TEST: Custom ACM certificate"
    enabled         = true
    is_ipv6_enabled = true
    price_class     = "PriceClass_100"
    retain_on_delete = false
    wait_for_deployment = false

    origin = {
      s3-ssl = {
        domain_name = "psl-test-cloudfront-mec.s3.eu-west-1.amazonaws.com"
        origin_id   = "S3-SSL-Origin"
      }
    }

    default_cache_behavior = {
      target_origin_id       = "S3-SSL-Origin"
      viewer_protocol_policy = "redirect-to-https"
      allowed_methods        = ["GET", "HEAD", "OPTIONS"]
      cached_methods         = ["GET", "HEAD"]
      compress               = true
      cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
      use_forwarded_values   = false
    }

    viewer_certificate = {
      minimum_protocol_version = "TLSv1.2_2021"
      cloudfront_default_certificate = true
    }

    create_origin_access_control = true
    origin_access_control = {
      ssl_oac = {
        description      = "Custom SSL OAC for S3"
        origin_type      = "s3"
        signing_behavior = "always"
        signing_protocol = "sigv4"
      }
    }

    tags = {
      Account     = "mec-development"
      Environment = "staging"
      Purpose     = "test-custom-ssl"
      Owner       = "DevOps"
      TestPhase   = "acm-validation"
    }
  }


  # IMPORT: Existing staging.mdquip.com distribution
  "staging.mdquip.com" = {
    aliases               = ["staging.mdquip.com"]
    comment              = "staging.mdquip.com"
    enabled              = true
    is_ipv6_enabled      = false
    price_class          = "PriceClass_All"
    default_root_object  = "index.html"
    retain_on_delete     = false
    wait_for_deployment  = false
    web_acl_id          = "arn:aws:wafv2:us-east-1:205551755912:global/webacl/FMManagedWebACLV2-psl-cloudfront-policy-1738006632540/c2e28a30-6f84-4c9a-b3b4-2892c9e81705"

    origin = {
      s3-staging = {
        domain_name = "phoenix-mec-staging.s3.amazonaws.com"
        origin_id   = "phoenix-staging-mdquip-s3-origin"
        origin_path = "/staging"

        # No OAI used in existing config
      }
    }

    default_cache_behavior = {
      target_origin_id       = "phoenix-staging-mdquip-s3-origin"
      viewer_protocol_policy = "redirect-to-https"
      allowed_methods        = ["GET", "HEAD"]
      cached_methods         = ["GET", "HEAD"]
      compress              = true

      use_forwarded_values = true
      query_string        = true
      headers             = ["user-agent"]
      cookies_forward     = "none"

      min_ttl     = 0
      default_ttl = 60
      max_ttl     = 31536000

      lambda_function_association = {
        origin-response = {
          lambda_arn   = "arn:aws:lambda:us-east-1:205551755912:function:phoenix-staging-mdquip-origin-response-lambda-edge:735"
          include_body = false
        }
        origin-request = {
          lambda_arn   = "arn:aws:lambda:us-east-1:205551755912:function:phoenix-staging-mdquip-origin-request-lambda-edge:737"
          include_body = false
        }
        viewer-response = {
          lambda_arn   = "arn:aws:lambda:us-east-1:205551755912:function:phoenix-staging-mdquip-viewer-response-lambda-edge:735"
          include_body = false
        }
        viewer-request = {
          lambda_arn   = "arn:aws:lambda:us-east-1:205551755912:function:phoenix-staging-mdquip-viewer-request-lambda-edge:474"
          include_body = false
        }
      }
    }

    ordered_cache_behavior = []
    custom_error_response  = []

    viewer_certificate = {
      acm_certificate_arn            = "arn:aws:acm:us-east-1:205551755912:certificate/c7cb4a17-2652-4735-99bb-29030a5d6cd8"
      ssl_support_method             = "sni-only"
      minimum_protocol_version       = "TLSv1.2_2021"
      cloudfront_default_certificate = false
    }

    geo_restriction = {
      restriction_type = "none"
      locations        = []
    }

    logging_config = {}

    create_origin_access_control  = false
    create_origin_access_identity = false

    tags = {
      Account     = "mec-development"
      Environment = "staging"
      Purpose     = "production-mdquip"
      Owner       = "DevOps"
    }
  }

}