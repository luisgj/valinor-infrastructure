module "vpc" {
  source = "./network"
  providers = {
    aws = aws.oregon
  }
}

module "instance" {
  source                 = "./instance"
  public_security_group  = module.vpc.public_security_group_id
  private_security_group = module.vpc.private_security_group_id
  public_subnet          = module.vpc.public_subnet
  private_subnet         = module.vpc.private_subnet
  public_key             = var.public_key
  providers = {
    aws = aws.oregon
  }
}

module "db" {
  source         = "./database"
  vpc_id         = module.vpc.vpc_id
  security_group = module.vpc.private_security_group_id
  subnet_ids     = [module.vpc.database_subnet_a, module.vpc.database_subnet_b]
  providers = {
    aws = aws.oregon
  }
}