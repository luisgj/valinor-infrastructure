## variables.tf of module
//TODO: Add type and descriptions
variable "instance_subnet" {
  default = "10.0.0.0/24"
}

variable "database_subnet_a" {
  default = "10.0.1.0/24"
}

variable "database_subnet_b" {
  default = "10.0.2.0/24"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "env" {
  default = "test"
}