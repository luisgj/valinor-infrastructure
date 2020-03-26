module "new_vpc" {
  source = "./network"
  env    = var.env
  providers = {
    aws = aws.oregon
  }
}

module "new_instance" {
  source         = "./boxes"
  security_group = module.new_vpc.security_group_id
  subnet         = module.new_vpc.instance_subnet
  providers = {
    aws = aws.oregon
  }
}