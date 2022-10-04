variable "bucket" {
    type=string
    default = "resumecloud13"
  
}

variable "endpoint" {
    description = "Endpoint url"
    type = string
    default = "http://resumecloud13.s3-website-us-east-1.amazonaws.com"
  
}

variable "domain_name" {
  description = "Domain name"
  type        = string
  default = "terraformtest.com"
}

variable "domain" { default = "terraformtest.com" }
variable "domainAlias" { default = "terraformtest.com" }
variable "subdomain" { default = "terraformtest.com" }
variable "subdomainAlias" { default = "terraformtest.com" }
variable "cdnSubDomain" { default = "terraformtest.com" }
variable "cf_alias_zone_id" {
  description = "Fixed hardcoded constant zone_id that is used for all CloudFront distributions"
  default = "Z2FDTNDATAQYW2"
}

