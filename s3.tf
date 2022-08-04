resource "aws_s3_object" "object" {
  bucket = "gwettlaufertestbucket455646"
  key    = "new_object_key"
  source = "index.html"
}
