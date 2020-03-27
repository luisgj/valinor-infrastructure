# provider.tf
provider "aws" {
  version = "~> 2.22.0"
  region  = "us-west-2"
  profile = var.aws_profile
  alias   = "oregon"
}