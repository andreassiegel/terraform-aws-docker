/*resource "aws_db_instance" "database" {
  identifier                 = "postgres-db"
  allocated_storage          = 5
  engine                     = "postgres"
  engine_version             = "9.6.2"
  instance_class             = "db.t2.micro"
  name                       = "${var.database_name}"
  username                   = "${var.database_user}"
  password                   = "${var.database_password}"
  auto_minor_version_upgrade = "true"
  db_subnet_group_name       = "${aws_db_subnet_group.db-default.name}"

  vpc_security_group_ids = [
    "${aws_security_group.postgres_rds.id}",
  ]

  parameter_group_name = "default.postgres9.6"
  option_group_name    = "default:postgres-9-6"
}
*/

