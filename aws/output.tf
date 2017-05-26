output "ip" {
  value = "${aws_instance.app.public_ip}"
}

output "docker_host_name" {
  value = "${var.docker_machine_name}"
}
