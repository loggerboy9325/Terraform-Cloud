resource "aws_s3_bucket" "object" {
  bucket = "gwettlaufertestbucket455646"
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
  tags = {
    terraform       = "true"
    website_hosting = "true"
  }
}


resource "aws_s3_object" "object_404" {
  bucket = "gwettlaufertestbucket455646"
  key    = "404.html"
  source = "404.html"

}
resource "aws_s3_object" "index" {
  bucket = "gwettlaufertestbucket455646"
  key    = "index.html"
  source = "index.html"

}

