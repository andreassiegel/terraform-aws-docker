variable "docker_host" {
  description = "Docker host to work on"
}

variable "docker_machine_name" {
  description = "Name of the remote Docker machine"
}

variable "container_image" {
  description = "Docker image to run"
}

variable "container_name" {
  description = "Name of the container"
}

variable "internal_port" {
  default     = 8080
  description = "Container port"
}

variable "external_port" {
  default     = 80
  description = "Host port"
}
