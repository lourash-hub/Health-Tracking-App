module "vpc" {
  source = "../vpc"
  availability_zones = var.availability_zones
}

module "lambda" {
  source = "../lambda"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
}

module "dynamodb" {
  source = "../dynamodb"
}

module "api_gateway" {
  source = "../api_gateway"
  lambda_function_arn = module.lambda.lambda_function_arn
}

resource "null_resource" "copy_test_script" {
  provisioner "local-exec" {
    command = "cp ${path.module}/../../test/test_integration.py ${path.module}/test_integration.py"
  }
}

resource "null_resource" "run_tests" {
  depends_on = [null_resource.copy_test_script]

  provisioner "local-exec" {
    command = "python3 ${path.module}/test_integration.py"
  }
}

