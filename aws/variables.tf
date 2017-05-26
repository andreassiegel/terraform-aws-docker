variable "public_key_path" {
  description = "path to the SSH private key to add to AWS"
}

variable "private_key_path" {
  description = "path to the SSH private key used to connect to the servers"
}

variable "aws_region" {
  description = "AWS region to launch servers"
}

variable "vpc_cidr" {
  default     = "10.100.0.0/16"
  description = "the vpc cdir"
}

variable "subnet_public_cidr" {
  default     = "10.100.1.0/24"
  description = "the cidr of the public subnet"
}

variable "subnet_private_cidr" {
  default     = "10.100.2.0/24"
  description = "the cidr of the private subnet"
}

variable "dns_private_zone_name" {
  description = "the internal dns name"
}

variable "dns_public_zone_id" {
  description = "the id of the hosted public zone"
}

variable "sub_domain_name" {
  description = "the subdomain segment to use for the server"
}

variable "ami" {
  type = "map"

  default = {
    eu-west-1 = "ami-a8d2d7ce"
  }
}

variable "database_name" {
  default     = "mydatabase"
  description = "name of the database"
}

variable "database_user" {
  default     = "user"
  description = "username for the database"
}

variable "database_password" {
  default     = "password"
  description = "password for the database"
}

variable "docker_machine_name" {
  default     = "remote-docker-host"
  description = "name of the remote docker host"
}
