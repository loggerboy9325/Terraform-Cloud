      resource "aws_s3_object" "ssa" {
  bucket = var.bucket
  key    = "ssa"
  source = "/images/SAA.png"
     }

 resource "aws_s3_object" "sap" {
  bucket = var.bucket
  key    = "SAP"
  source = "/images/SAP.png"
 }