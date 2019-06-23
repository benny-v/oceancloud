resource "digitalocean_database_cluster" "nextcloud" {
  name       = "${var.name}-database"
  region     = "${var.region}"
  engine     = "pg"
  version    = "11"
  size       = "${var.database_size}"
  node_count = 1
}