resource "digitalocean_loadbalancer" "nextcloud" {
  name = "${var.name}-loadbalancer"
  region = "${var.region}"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }

  droplet_ids = ["${digitalocean_droplet.nextcloud.id}"]
}