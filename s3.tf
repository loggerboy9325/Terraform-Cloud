resource "aws_s3_bucket" "resume" {
  bucket = "resumecloud13"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}



resource "aws_s3_object" "index" {
  bucket = "resumecloud13"
  key    = "index.html"
  source = "index.html"
 

 depends_on = [
    aws_s3_bucket.resume
  ]
}

resource "aws_s3_object" "script" {
  bucket = "resumecloud13"
  key    = "script.js"
  source = "script.js"
  
  depends_on = [
    aws_s3_bucket.resume
  ]
}
