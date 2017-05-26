provider "aws" {
  region = "${var.aws_region}"
}

module "aws" {
  source = "./aws"

  aws_region = "${var.aws_region}"

  sub_domain_name       = "app"
  dns_private_zone_name = "andreassiegel.internal"
  dns_public_zone_id    = "${var.aws_public_zone_id}"

  private_key_path = "~/.ssh/aws_deployer_rsa"
  public_key_path  = "~/.ssh/aws_deployer_rsa.pub"

  docker_machine_name = "app"
}

module "docker" {
  source = "./docker"

  docker_host         = "${module.aws.ip}"
  docker_machine_name = "${module.aws.docker_host_name}"

  container_image = "andreassiegel/hello-echo:latest"
  container_name  = "echo"
}
