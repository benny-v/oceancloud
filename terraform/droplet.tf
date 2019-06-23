resource "digitalocean_droplet" "nextcloud" {
  image  = "docker-18-04"
  name   = "${var.name}-docker-host"
  region = "${var.region}"
  size   = "${var.droplet_size}"
  private_networking = "true"
  user_data = "${file("user_data.sh")}"
}