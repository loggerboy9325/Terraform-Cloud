resource "aws_s3_bucket" "b" {
  bucket = "terraformtest3434243324"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}

resource "aws_s3_bucket_object" "object" {
  bucket = "terraformtest3434243324"
  key    = "new_object_key"
  source = "indexupdated.html"

 depends_on = [
    aws_s3_bucket.b
  ]
}