resource "aws_docdb_cluster" "docdb_cluster" {
  cluster_identifier = "activity-cluster"
  master_username    = "username"
  master_password    = "password"
  engine             = "docdb"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}

resource "aws_docdb_cluster_instance" "instance" {
  identifier         = "activity-instance"
  cluster_identifier = aws_docdb_cluster.docdb_cluster.id
  instance_class     = "db.r5.large"
}
