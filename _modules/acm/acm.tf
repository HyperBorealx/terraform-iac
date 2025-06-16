data "cloudflare_zone" "all" {
  for_each = toset(values(var.domain_to_zone))
  name     = each.value
}

# ACM Certificate Module
module "acm" {
  source = "terraform-aws-modules/acm/aws"
  providers = {
    aws = aws.acm
  }
  domain_name               = var.domain_name
  subject_alternative_names = var.domain_sans
  validation_method         = "DNS"
  create_route53_records    = false
  tags = merge(var.acm_tags, {
    TerraformTrack = trim(
      replace(
        path.cwd,
        regexall("^.*/live/", path.cwd)[0],
        ""
      ),
      "/"
    )
  })
}

# Cloudflare DNS Records for validation
resource "cloudflare_record" "validation" {
  for_each = {
    for idx, domain in module.acm.distinct_domain_names :
    domain => module.acm.validation_domains[idx]
  }

  zone_id = data.cloudflare_zone.all[var.domain_to_zone[each.key]].id

  name    = each.value.resource_record_name
  type    = each.value.resource_record_type
  content = trimsuffix(each.value.resource_record_value, ".")

  ttl             = 1
  proxied         = false
  allow_overwrite = true
  tags = toset([
    for k, v in merge(
      var.cf_tags,
      {
        TerraformTrack = trim(
          replace(
            path.cwd,
            regexall("^.*/live/", path.cwd)[0],
            ""
          ),
          "/"
        )
      }
    ) : "${k}:${v}"
  ])
}


