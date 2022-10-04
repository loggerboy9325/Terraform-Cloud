data "aws_iam_policy_document" "s3policy"{
    statement {
      actions = ["s3:GetObject"]

      resources = [
        
        "arn:aws:s3:::resumecloud13/*"
      ]

      principals {
        type = "AWS"
        identifiers = [aws_cloudfront_origin_access_identity.oai.iam_arn]
      }
    }
}

data "aws_route53_zone" "domain" {
  name = var.domain_name
}
