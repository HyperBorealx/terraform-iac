# module "example" {
#   source      = "../../../../../../_modules/acm"
#   domain_name = "example.com"
#   domain_sans = ["staging.example.com", "abc.org", "xyz.net", "www.example.com"]
#   domain_to_zone = {
#     "subdomain.com"           = "domain.com"
#     "example.com"         = "example.com"
#     "staging.example.com" = "example.com"
#     "abc.org"             = "example.com"
#     "xyz.net"             = "example.com"
#     "www.example.com"     = "example.com"
#   }
#   acm_tags = {
#     Owner         = ""
#     BusinessGroup = ""
#     Environment   = ""
#     ResourceType  = "ACM"
#     SLALevel      = ""
#   }
#   acm_tags = {
#     Owner         = ""
#     BusinessGroup = ""
#     Environment   = ""
#     ResourceType  = "ACM"
#     SLALevel      = ""
# }
# Import Command : 
# ACM Cert : terraform import 'module.name.module.acm.aws_acm_certificate.this[0]' <certarn>
# Cloudflare record : terraform import 'module.name.cloudflare_record.validation["domain"]' ZoneID/RecordID

module "staging_login_dougallgpt_com" {
  providers = { 
    aws = aws
    aws.acm = aws.acm
    aws.ss  = aws.ss
  }
  source      = "../../../../../../_modules/acm"
  domain_name = "staging.login.dougallgpt.com"
  domain_sans = []
  domain_to_zone = {
    "staging.login.dougallgpt.com" = "dougallgpt.com"
  }
  acm_tags = {
    Owner         = "Dougall"
    BusinessGroup = "Phoenix"
    Environment   = "Staging"
    ResourceType  = "ACM"
    SLALevel      = "Tier2"
    Associated    = "Cloudfront"
  }
  cf_tags = {
    Owner         = "Dougall"
    BusinessGroup = "Phoenix"
    Environment   = "Staging"
    ResourceType  = "ACM"
    SLALevel      = "Tier2"
  }
}

