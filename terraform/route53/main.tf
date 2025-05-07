terraform {

  backend "s3" {
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}

# update subdomains records
resource "aws_route53_record" "cname_record" {
  for_each = var.sub_domains
  zone_id  = data.aws_route53_zone.hosted_zone.zone_id
  name     = each.key
  type     = "CNAME"
  ttl      = 300
  records  = [var.target]
}

