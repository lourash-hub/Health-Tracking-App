resource "aws_dynamodb_table" "measurements" {
  name           = "Measurements"
  hash_key       = "utc_timestamp"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "utc_timestamp"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.dynamodb_key.arn
  }
}

resource "aws_kms_key" "dynamodb_key" {
  description = "KMS key for DynamoDB encryption"
  enable_key_rotation = true
}
