# CloudFront Distribution Configuration - MEC Development Staging
# Clean test configuration without Lambda@Edge

distributions = {
  # Simple test distribution with cache policies
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

  # Simple test distribution with forwarded values
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
}