variable "distributions" {
  description = "Map of CloudFront distributions to create"
  type = map(object({
    # Basic distribution settings
    aliases                     = optional(list(string), [])
    comment                     = optional(string)
    enabled                     = optional(bool, true)
    is_ipv6_enabled            = optional(bool, true)
    price_class                = optional(string, "PriceClass_100")
    retain_on_delete           = optional(bool, false)
    wait_for_deployment        = optional(bool, false)

    # Origin configuration
    origin = map(object({
      domain_name              = string
      origin_id               = string
      origin_path             = optional(string, "")
      connection_attempts      = optional(number, 3)
      connection_timeout       = optional(number, 10)
      custom_origin_config     = optional(object({
        http_port                = number
        https_port               = number
        origin_protocol_policy   = string
        origin_ssl_protocols     = list(string)
        origin_keepalive_timeout = optional(number, 5)
        origin_read_timeout      = optional(number, 30)
      }))
      s3_origin_config        = optional(object({
        origin_access_identity = optional(string)
      }))
      custom_headers = optional(list(object({
        name  = string
        value = string
      })), [])
      origin_shield = optional(object({
        enabled              = bool
        origin_shield_region = string
      }))
    }))

    # Default cache behavior
    default_cache_behavior = object({
      target_origin_id         = string
      viewer_protocol_policy   = string
      allowed_methods          = list(string)
      cached_methods           = list(string)
      compress                 = optional(bool, true)

      # Legacy forwarding (use cache_policy_id instead when possible)
      query_string             = optional(bool, false)
      query_string_cache_keys  = optional(list(string), [])
      cookies                  = optional(object({
        forward           = string
        whitelisted_names = optional(list(string), [])
      }))
      headers                  = optional(list(string), [])

      # Modern policy-based approach (recommended)
      cache_policy_id          = optional(string)
      origin_request_policy_id = optional(string)
      response_headers_policy_id = optional(string)

      # TTL settings (only when not using cache_policy_id)
      min_ttl                  = optional(number, 0)
      default_ttl              = optional(number, 86400)
      max_ttl                  = optional(number, 31536000)

      # Security
      trusted_signers          = optional(list(string), [])
      trusted_key_groups       = optional(list(string), [])

      # Lambda@Edge and CloudFront Functions
      lambda_function_association = optional(list(object({
        event_type   = string # viewer-request, origin-request, viewer-response, origin-response
        lambda_arn   = string # Must be published version ARN (not $LATEST)
        include_body = optional(bool, false)
      })), [])

      function_association = optional(list(object({
        event_type   = string # viewer-request, viewer-response
        function_arn = string # CloudFront Function ARN
      })), [])
    })

    # Ordered cache behaviors
    ordered_cache_behavior = optional(list(object({
      path_pattern             = string
      target_origin_id         = string
      viewer_protocol_policy   = string
      allowed_methods          = list(string)
      cached_methods           = list(string)
      compress                 = optional(bool, true)

      # Legacy forwarding
      query_string             = optional(bool, false)
      query_string_cache_keys  = optional(list(string), [])
      cookies                  = optional(object({
        forward           = string
        whitelisted_names = optional(list(string), [])
      }))
      headers                  = optional(list(string), [])

      # Modern policy-based approach
      cache_policy_id          = optional(string)
      origin_request_policy_id = optional(string)
      response_headers_policy_id = optional(string)

      # TTL settings
      min_ttl                  = optional(number, 0)
      default_ttl              = optional(number, 86400)
      max_ttl                  = optional(number, 31536000)

      # Security
      trusted_signers          = optional(list(string), [])
      trusted_key_groups       = optional(list(string), [])

      # Lambda@Edge and CloudFront Functions
      lambda_function_association = optional(list(object({
        event_type   = string # viewer-request, origin-request, viewer-response, origin-response
        lambda_arn   = string # Must be published version ARN (not $LATEST)
        include_body = optional(bool, false)
      })), [])

      function_association = optional(list(object({
        event_type   = string # viewer-request, viewer-response
        function_arn = string # CloudFront Function ARN
      })), [])
    })), [])

    # Custom error responses
    custom_error_response = optional(list(object({
      error_code            = number
      response_code         = number
      response_page_path    = string
      error_caching_min_ttl = optional(number, 300)
    })), [])

    # SSL/TLS configuration
    viewer_certificate = optional(object({
      acm_certificate_arn      = optional(string)
      cloudfront_default_certificate = optional(bool, true)
      ssl_support_method       = optional(string)
      minimum_protocol_version = optional(string, "TLSv1.2_2021")
    }))

    # Geographic restrictions
    geo_restriction = optional(object({
      restriction_type = string
      locations        = list(string)
    }), null)

    # Logging configuration
    logging_config = optional(object({
      bucket          = string
      include_cookies = optional(bool, false)
      prefix          = optional(string, "")
    }), null)

    # Origin Access Control (OAC) - Modern approach
    create_origin_access_control = optional(bool, false)
    origin_access_control = optional(map(object({
      description      = string
      origin_type      = string
      signing_behavior = string
      signing_protocol = string
    })), {})

    # Origin Access Identity (OAI) - Legacy approach
    create_origin_access_identity = optional(bool, false)
    origin_access_identities = optional(map(string), {})

    # Monitoring
    create_monitoring_subscription        = optional(bool, false)
    realtime_metrics_subscription_status = optional(string, "Enabled")

    # Tags
    tags = optional(map(string), {})
  }))
  default = {}
}