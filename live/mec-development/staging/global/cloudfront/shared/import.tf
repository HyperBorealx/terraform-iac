# CloudFront Distribution Import Configuration
#
# INSTRUCTIONS:
# 1. Replace test distributions in terraform.tfvars with actual configurations
# 2. Uncomment and customize import blocks below for each existing distribution
# 3. Run: terraform plan (should show "X to import, 0 to change")
# 4. Run: terraform apply to import distributions to Terraform state
#
# CRITICAL: Configuration in terraform.tfvars must match existing distributions EXACTLY

# TODO: Uncomment and customize these import blocks after discovery phase

# Primary Phoenix MEC Staging Distribution
# import {
#   to = module.cloudfront.module.cloudfront_distributions["phoenix-mec-staging"].aws_cloudfront_distribution.this[0]
#   id = "E22KIKJ202IBCL"
# }

# Secondary Distribution
# import {
#   to = module.cloudfront.module.cloudfront_distributions["phoenix-mec-secondary"].aws_cloudfront_distribution.this[0]
#   id = "E1M57ZI0S5V451"
# }

# Additional Staging Distribution
# import {
#   to = module.cloudfront.module.cloudfront_distributions["phoenix-mec-additional"].aws_cloudfront_distribution.this[0]
#   id = "E3KCB5IJKNG70H"
# }

# PeerVoice Staging Distributions
# import {
#   to = module.cloudfront.module.cloudfront_distributions["peervoice-staging"].aws_cloudfront_distribution.this[0]
#   id = "E3IEZ7A8CG369J"
# }

# MD-FI Staging Distributions
# import {
#   to = module.cloudfront.module.cloudfront_distributions["md-fi-staging"].aws_cloudfront_distribution.this[0]
#   id = "ENQF8077V8AJW"
# }

# FirstWord Edge Staging Distribution
# import {
#   to = module.cloudfront.module.cloudfront_distributions["firstword-staging"].aws_cloudfront_distribution.this[0]
#   id = "E12EPKZZCYOBKU"
# }

# API Staging Distribution
# import {
#   to = module.cloudfront.module.cloudfront_distributions["api-staging"].aws_cloudfront_distribution.this[0]
#   id = "E1DX9TJCGIKBG1"
# }

# Additional distributions based on discovery script results
# import {
#   to = module.cloudfront.module.cloudfront_distributions["DISTRIBUTION_NAME"].aws_cloudfront_distribution.this[0]
#   id = "DISTRIBUTION_ID"
# }

# IMPORT VALIDATION CHECKLIST:
# □ Discovery script completed
# □ All existing distributions identified
# □ terraform.tfvars updated with exact configurations
# □ terraform validate passes
# □ terraform plan shows "X to import, 0 to change, 0 to destroy"
# □ No new resources will be created
# □ No existing resources will be modified
# □ Distribution IDs preserved (no downtime)

# TROUBLESHOOTING IMPORT ISSUES:
#
# Error: "configuration does not match"
# Solution: Update terraform.tfvars to match existing distribution exactly
#
# Error: "resource already exists"
# Solution: Remove any existing resources from state first
#
# Error: "distribution not found"
# Solution: Verify distribution ID is correct and exists in account