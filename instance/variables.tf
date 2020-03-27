variable "public_security_group" {
  description = "ID of the vpc security group to use for public access"
  type        = string
}

variable "private_security_group" {
  description = "ID of the vpc security group to use for private access"
  type        = string
}

variable "public_subnet" {
  description = "ID of the vpc security group to use for the instance"
  type        = string
}

variable "private_subnet" {
  description = "ID of the vpc security group to use for the instance"
  type        = string
}

variable "public_key" {
  description = "the public key for the access key pair"
  type = string
}