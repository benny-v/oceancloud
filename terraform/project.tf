resource "digitalocean_project" "nextcloud" {
  name        = "${var.name}"
  resources   = [
    "do:dbaas:${digitalocean_database_cluster.nextcloud.id}",
    "do:droplet:${digitalocean_droplet.nextcloud.id}",
    "do:volume:${digitalocean_volume.nextcloud.id}",
    "do:loadbalancer:${digitalocean_loadbalancer.nextcloud.id}",
    ]
}