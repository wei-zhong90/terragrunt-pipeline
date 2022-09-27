variable "subnet_id" {
  type = string
}

variable "public_key" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "database_user" {
  type = string
}

variable "database_password" {
  type = string
}
variable "database_name" {
  type = string
}
variable "db_endpoint" {
  type = string
}

variable "root_volume_size" {
  type = number
}