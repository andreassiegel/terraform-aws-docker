resource "aws_vpc_dhcp_options" "internal" {
  domain_name = "${var.dns_private_zone_name}"

  domain_name_servers = [
    "AmazonProvidedDNS",
  ]

  tags {
    Name = "internal private DNS name"
  }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id          = "${aws_vpc.main.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.internal.id}"
}

resource "aws_route53_zone" "main" {
  name    = "${var.dns_private_zone_name}"
  vpc_id  = "${aws_vpc.main.id}"
  comment = "managed by Terraform"
}

resource "aws_route53_record" "app-private" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "${var.sub_domain_name}.${var.dns_private_zone_name}"
  type    = "A"
  ttl     = "300"

  records = [
    "${aws_instance.app.private_ip}",
  ]
}

resource "aws_route53_record" "app-public" {
  zone_id = "${var.dns_public_zone_id}"
  name    = "${var.sub_domain_name}"
  type    = "A"
  ttl     = "300"

  records = [
    "${aws_instance.app.public_ip}",
  ]
}
