resource "aws_cognito_user_pool" "user_pool" {
  name = "health-tracking-user-pool"
}

resource "aws_cognito_user_pool_client" "client" {
  name         = "health-tracking-client"
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

resource "aws_cognito_user_pool_domain" "domain" {
  domain       = "healthtrackingapp"
  user_pool_id = aws_cognito_user_pool.user_pool.id
}
