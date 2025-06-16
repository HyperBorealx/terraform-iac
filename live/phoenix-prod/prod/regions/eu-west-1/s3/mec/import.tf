import {
  to = module.s3.module.s3_buckets["phoenix-internal-prod"].aws_s3_bucket.this[0]
  id = "phoenix-internal-prod"
}

import {
  to = module.s3.module.s3_buckets["phoenix-internal-uat"].aws_s3_bucket.this[0]
  id = "phoenix-internal-uat"
}

import {
  to = module.s3.module.s3_buckets["phoenix-mec-uat"].aws_s3_bucket.this[0]
  id = "phoenix-mec-uat"
}

import {
  to = module.s3.module.s3_buckets["phoenix-prod-dynamic-siteconfig"].aws_s3_bucket.this[0]
  id = "phoenix-prod-dynamic-siteconfig"
}
