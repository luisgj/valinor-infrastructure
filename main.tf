module "new_vpc" {
  source = "./network"
  env    = var.env
  providers = {
    aws = aws.oregon
  }
}