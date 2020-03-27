variable "vpc_id" {
  type = string
  description = "the ID of the vpc"
}

variable "security_group" {
  type = string
  description = "the ID of the security group to use"
}

variable "env" {
  type = string
  description = "env"
  default = "test"
}

variable "subnet_ids" {
  type = list(string)
  description = "a list of subnets to create a subnet group"
  default = []
}