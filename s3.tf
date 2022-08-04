resource "aws_s3_object" "object" {
  bucket = "myterraformcloudtestbucket"
  key    = "new_object_key"
  source = "index.html"
}
