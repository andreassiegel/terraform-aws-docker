resource "aws_security_group" "allow_all_ssh" {
  name        = "allow_all_ssh"
  description = "Allow inbound SSH traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Allow SSH"
  }
}

resource "aws_security_group" "allow_all_docker" {
  name        = "allow_all_docker"
  description = "Allow inbound Docker traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 2376
    to_port     = 2376
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Allow Docker"
  }
}

resource "aws_security_group" "web_server" {
  name        = "web_server"
  description = "Allow HTTP and HTTPS traffic in, browser access out"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Web Server"
  }
}

resource "aws_security_group" "internet_access" {
  name        = "internet_access"
  description = "Allow outgoing internet access"
  vpc_id      = "${aws_vpc.main.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Internet Access"
  }
}
