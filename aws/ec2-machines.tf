resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${file("${var.public_key_path}")}"
}

resource "aws_instance" "app" {
  ami                         = "${lookup(var.ami, var.aws_region)}"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "${aws_key_pair.deployer.key_name}"
  subnet_id                   = "${aws_subnet.public.id}"
  disable_api_termination     = "false"

  vpc_security_group_ids = [
    "${aws_security_group.web_server.id}",
    "${aws_security_group.allow_all_ssh.id}",
    "${aws_security_group.allow_all_docker.id}",
    "${aws_security_group.internet_access.id}",
  ]

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D",
      "sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'",
      "sudo apt-get update",
      "apt-cache policy docker-engine",
      "sudo apt-get install -y docker-engine",
      "sudo usermod -aG docker $(whoami)",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = "${self.public_ip}"
      private_key = "${file("${var.private_key_path}")}"
      timeout     = "5m"
      agent       = "true"
    }
  }

  provisioner "local-exec" {
    command = "docker-machine create --driver generic --generic-ip-address=${self.public_ip} --generic-ssh-key ${var.private_key_path} --generic-ssh-user=ubuntu ${var.docker_machine_name}"
  }

  depends_on = [
    "aws_internet_gateway.gateway",
  ]
}
