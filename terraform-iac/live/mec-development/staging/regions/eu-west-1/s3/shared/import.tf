/*
terraform import 'module.s3.module.s3_buckets["phoenix-mec-staging"].aws_s3_bucket.this[0]' 'phoenix-mec-staging'
*/
import {
  to = module.s3.module.s3_buckets["phoenix-mec-staging"].aws_s3_bucket.this[0]
  id = "phoenix-mec-staging"
}


/*
terraform import 'module.s3.module.s3_buckets["phoenix-mec-staging"].aws_s3_bucket_policy.this[0]' 'phoenix-mec-staging'
*/
import {
  to = module.s3.module.s3_buckets["phoenix-mec-staging"].aws_s3_bucket_policy.this[0]
  id = "phoenix-mec-staging"
}


/*
terraform import 'module.s3.module.s3_buckets["phoenix-mec-staging"].aws_s3_bucket_cors_configuration.this[0]' 'phoenix-mec-staging'
*/
import {
  to = module.s3.module.s3_buckets["phoenix-mec-staging"].aws_s3_bucket_cors_configuration.this[0]
  id = "phoenix-mec-staging"
}


/*
terraform import 'module.s3.module.s3_buckets["phoenix-mec-staging"].aws_s3_bucket_acl.this[0]' 'phoenix-mec-staging'
*/
import {
  to = module.s3.module.s3_buckets["phoenix-mec-staging"].aws_s3_bucket_acl.this[0]
  id = "phoenix-mec-staging"
}

import {
  to = module.s3.module.s3_buckets["phoenix-mec-backup"].aws_s3_bucket.this[0]
  id = "phoenix-mec-backup"
}
