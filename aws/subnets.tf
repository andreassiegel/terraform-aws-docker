resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.subnet_public_cidr}"
  map_public_ip_on_launch = "true"

  tags {
    Name = "Public subnet"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_subnet" "private" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.subnet_private_cidr}"

  tags {
    Name = "Private subnet"
  }
}
