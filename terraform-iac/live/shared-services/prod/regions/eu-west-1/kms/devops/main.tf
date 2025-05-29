variable "keys" {
  type = any
}

import {
  id = "arn:aws:kms:eu-west-1:300476207176:key/2e5f57d5-b15e-471c-94f9-98e35c1319d2"
  to = module.shared_services_kms.aws_kms_key.this["shared-services-sops"]
}

import {
  id = "alias/prod-shared-services"
  to = module.shared_services_kms.aws_kms_alias.this["shared-services-sops-prod-shared-services"]
}

module "shared_services_kms" {
  source = "../../../../../../../_modules/kms"

  keys = var.keys
}
