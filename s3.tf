resource "aws_s3_bucket" "b" {
  bucket = "resumecloud13"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}



resource "aws_s3_bucket_object" "object" {
  bucket = "resumecloud13"
  key    = "new_object_key"
  source = "index.html"

 depends_on = [
    aws_s3_bucket.b
  ]
}