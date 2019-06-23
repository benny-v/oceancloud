resource "digitalocean_volume" "nextcloud" {
  name                    = "nextcloud-data-storage"
  region                  = "${var.region}"
  size                    = "${var.storage_size}"
  initial_filesystem_type = "ext4"
  description             = "persistent storage for nextcloud instance"
}