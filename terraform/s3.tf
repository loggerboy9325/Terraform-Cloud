resource "aws_s3_bucket" "resume" {
  bucket = var.bucket
 

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "dockercert" {
  bucket = var.bucket
  key    = "ResumeFinal.pdf"
  source = "./website_files/images/docker.png"
 
 depends_on = [
   aws_s3_bucket.resume
 ]
 
}

resource "aws_s3_object" "gocert" {
  bucket = var.bucket
  key    = "ResumeFinal.pdf"
  source = "./website_files/images/go.png"
 
 depends_on = [
   aws_s3_bucket.resume
 ]
 
}

resource "aws_s3_object" "pdf" {
  bucket = var.bucket
  key    = "ResumeFinal.pdf"
  source = "./website_files/George_wettlaufer_resume.pdf"
 
 depends_on = [
   aws_s3_bucket.resume
 ]
 
}



  resource "aws_s3_object" "index" {
bucket = var.bucket
  key    = "index.html"
  source = "./website_files/index.html"
   content_type = "text/html"
 
 depends_on = [
  aws_s3_bucket.resume
 ]

}

resource "aws_s3_object" "script" {
  bucket = var.bucket
  key    = "script.js"
  source = "./website_files/script.js"
   depends_on = [
   aws_s3_bucket.resume
 ]

}

resource "aws_s3_object" "ccp" {
  bucket = var.bucket
  key    = "images/CCP.png"
  source = "./website_files/images/CCP.png"
 
 depends_on = [
   aws_s3_bucket.resume
 ]
 
}



    resource "aws_s3_object" "portrait" {
  bucket = var.bucket
  key    = "images/portrait.jpg"
  source = "./website_files/images/portrait.jpg"

   depends_on = [
   aws_s3_bucket.resume
 ]
 }


    resource "aws_s3_object" "error" {
  bucket = var.bucket
  key    = "404.html"
  source = "./website_files/404.html"
  content_type = "text/html"

   depends_on = [
   aws_s3_bucket.resume
 ]
    }

      resource "aws_s3_object" "ssa" {
  bucket = var.bucket
  key    = "images/SAA.png"
  source = "./website_files/images/SAA.png"
   depends_on = [
   aws_s3_bucket.resume
 ]
     }

 resource "aws_s3_object" "sap" {
  bucket = var.bucket
  key    = "images/SAP.png"
  source = "./website_files/images/SAP.png"
   depends_on = [
   aws_s3_bucket.resume
 ]
 }


resource "aws_s3_bucket_public_access_block" "s3block" {
  bucket                  = aws_s3_bucket.resume.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "s3policy" {
  bucket = aws_s3_bucket.resume.id
  policy = data.aws_iam_policy_document.s3policy.json
}
