# Import existing CloudFront distributions
#
# USAGE:
# 1. Replace DISTRIBUTION_ID with actual CloudFront distribution ID
# 2. Replace OAI_ID with actual Origin Access Identity ID
# 3. Uncomment the import blocks you want to use
# 4. Run: terraform plan (should show "X to import, 0 to change")
# 5. Run: terraform apply

# Import phoenix-mec-staging distribution
# First, find the distribution ID: aws cloudfront list-distributions --profile dev-mec
#  import {
#    to = module.cloudfront.module.cloudfront_distributions["staging.mdquip.com"].aws_cloudfront_distribution.this[0]
#    id = "E2YRG2SBRZR17K"  # REPLACE with actual distribution ID
# }

# First, find OAI ID: aws cloudfront list-cloud-front-origin-access-identities --profile dev-mec
 #import {
  # to = module.cloudfront.module.cloudfront_distributions["staging.mdquip.com"].aws_cloudfront_origin_access_identity.this["existing_oai"]
  # id = "E2J1LBFY8F29KX"  # REPLACE with actual OAI ID
 #}
