variable "public_subnet" {
  default = "10.0.0.0/24"
  type = string
}

variable "database_subnet_a" {
  default = "10.0.1.0/24"
  type = string
}

variable "database_subnet_b" {
  default = "10.0.2.0/24"
  type = string
}

variable "private_subnet" {
  default = "10.0.3.0/24"
  type = string
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "env" {
  default = "test"
  type = string
}