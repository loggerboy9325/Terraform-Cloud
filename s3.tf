resource "aws_s3_bucket" "testbucket" {
  bucket = "myterraformcloudtestbucket"

  tags = {
    "Env" : "Dev",
    "Video" : "CloudQuickLabs"
  }
}
