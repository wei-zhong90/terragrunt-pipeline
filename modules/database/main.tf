resource "aws_db_subnet_group" "RDS_subnet_grp" {
  subnet_ids = [var.private_subenta_id, var.private_subentb_id]
}

resource "aws_db_instance" "wordpressdb" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.large"
  identifier             = "web-database"
  db_subnet_group_name   = aws_db_subnet_group.RDS_subnet_grp.id
  vpc_security_group_ids = ["${aws_security_group.RDS_allow_rule.id}"]
  db_name                = var.database_name
  username               = var.database_user
  password               = var.database_password
  skip_final_snapshot    = true
}
