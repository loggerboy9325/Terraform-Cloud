resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "ID"
  

  attribute {
    name = "ID"
    type = "S"
  }

tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }

}