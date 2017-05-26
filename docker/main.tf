provider "docker" {
  host      = "tcp://${var.docker_host}:2376"
  cert_path = "/Users/as/.docker/machine/machines/${var.docker_machine_name}"
}

resource "docker_image" "image" {
  name = "${var.container_image}"
}

resource "docker_container" "container" {
  image    = "${docker_image.image.latest}"
  name     = "${var.container_name}"
  hostname = "${var.container_name}"
  restart  = "on-failure"
  must_run = "true"

  ports {
    internal = "${var.internal_port}"
    external = "${var.external_port}"
  }
}
