output "nextcloud_IP_adress" {
  value = "${digitalocean_loadbalancer.nextcloud.ip}"
}

output "database_name" {
  value = "${digitalocean_database_cluster.nextcloud.database}"
}

output "database_user" {
  value = "${digitalocean_database_cluster.nextcloud.user}"
}

output "database_password" {
  value = "${digitalocean_database_cluster.nextcloud.password}"
}

output "database_host" {
  value = "${digitalocean_database_cluster.nextcloud.host}"
}

output "database_port" {
  value = "${digitalocean_database_cluster.nextcloud.port}"
}