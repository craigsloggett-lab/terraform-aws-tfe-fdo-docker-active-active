resource "aws_acm_certificate" "tfe" {
  domain_name       = aws_route53_record.alias_record.name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "tfe" {
  certificate_arn         = aws_acm_certificate.tfe.arn
  validation_record_fqdns = [aws_route53_record.cert_validation_record.fqdn]
}
