resource "aws_s3_bucket" "resume" {
  bucket = var.bucket

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}



resource "aws_s3_object" "index" {
  bucket = var.bucket
  key    = "index.html"
  source = "index.html"
 


}

resource "aws_s3_object" "script" {
  bucket = var.bucket
  key    = "script.js"
  source = "script.js"
  

}

resource "aws_s3_object" "ccp" {
  bucket = var.bucket
  key    = "ccp.png"
  source = "front-end/images/CCP.png"
 

 
}

    resource "aws_s3_object" "portrait" {
  bucket = var.bucket
  key    = "portrait"
  source = "front-end/images/portrait.jpg"
 



    }

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = var.bucket

  index_document {
    suffix = "front-end/index.html"
  }

  error_document {
    key = "front-end/error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}