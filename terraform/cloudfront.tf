resource "aws_cloudfront_distribution" "cdn" {


  origin {
    domain_name = aws_s3_bucket.resume.bucket_regional_domain_name
    origin_id = aws_s3_bucket.resume.bucket_regional_domain_name
    s3_origin_config {
        origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }
  enabled = true
  default_root_object = "index.html"


  aliases = [var.domain_name, var.sub_domain]
  price_class = "PriceClass_200"
  retain_on_delete = false
  
  
  default_cache_behavior {
    allowed_methods = [ "DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT" ]
    cached_methods = [ "GET", "HEAD" ]
    target_origin_id =  aws_s3_bucket.resume.bucket_regional_domain_name
    
    
    forwarded_values {
      query_string = false
      
      cookies {
        forward = "none"
      }
    }
    
    viewer_protocol_policy = "redirect-to-https"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }
 viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.cert.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2018"
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"

      

      
    }
      }
      depends_on = [
        aws_s3_bucket.resume
      ]
    }
  


resource "aws_route53_record" "websiteurl" {
  name    = var.domain_name
  zone_id = data.aws_route53_zone.domain.zone_id
  type    = "A"

  

  alias {
     
    name                   = aws_cloudfront_distribution.cdn.domain_name
    zone_id                = aws_cloudfront_distribution.cdn.hosted_zone_id
    evaluate_target_health = true

  
  }
}
  resource "aws_route53_record" "subdomainrecord" {
  name    = var.sub_domain
  zone_id = data.aws_route53_zone.domain.zone_id
  type    = "A"

  

  alias {
     
    name                   = aws_cloudfront_distribution.cdn.domain_name
    zone_id                = aws_cloudfront_distribution.cdn.hosted_zone_id
    evaluate_target_health = true
  }
  }


resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for ${var.endpoint}"


}

resource "aws_acm_certificate" "cert" {
 
  domain_name               = "*.gwresume.com"
  subject_alternative_names = ["*www.gwresume.com"]
  validation_method         = "DNS"
  tags                      = local.tags


  lifecycle {
    create_before_destroy = true
    
  }
}

data "aws_route53_zone" "route53_zone" {
  name = "gwresume.com"
  private_zone = false
  
}

resource "aws_route53_record" "route53_record" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name = dvo.resource_record_name
      record = dvo.resource_record_value
      type = dvo.resource_record_type


    }
  }
allow_overwrite = true
name = each.value.name
records = [each.value.record]
ttl = 60
type = each.value.type
zone_id = data.aws_route53_zone.route53_zone.zone_id
  
}

resource "aws_acm_certificate_validation" "cert_valid" {
  certificate_arn =aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.route53_record : record.fqdn]

  depends_on = [
    aws_acm_certificate.cert
  ]

}
