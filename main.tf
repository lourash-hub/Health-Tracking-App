module "vpc" {
  source = "./modules/vpc"
  availability_zones = var.availability_zones
}

module "cognito" {
  source = "./modules/cognito"
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "docdb" {
  source = "./modules/docdb"
}

module "lambda" {
  source = "./modules/lambda"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
}

module "api_gateway" {
  source = "./modules/api_gateway"
  lambda_function_arn = module.lambda.lambda_function_arn
}

module "testing" {
  source = "./modules/testing"
  availability_zones = var.availability_zones
}