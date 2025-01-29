resource "aws_route53_record" "cert_validation_record" {
  name    = element(aws_acm_certificate.tfe.domain_validation_options[*].resource_record_name, 0)
  type    = element(aws_acm_certificate.tfe.domain_validation_options[*].resource_record_type, 0)
  records = aws_acm_certificate.tfe.domain_validation_options[*].resource_record_value
  zone_id = data.aws_route53_zone.tfe.zone_id
  ttl     = 60
}

resource "aws_route53_record" "alias_record" {
  name    = local.route53_alias_record_name
  zone_id = data.aws_route53_zone.tfe.zone_id
  type    = "A"
  alias {
    name    = aws_lb.tfe.dns_name
    zone_id = aws_lb.tfe.zone_id

    evaluate_target_health = false
  }
}
