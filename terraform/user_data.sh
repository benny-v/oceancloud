#!/bin/bash

DIGITALOCEAN_TOKEN=INSERT_TOKEN_HERE

set -e

sudo curl \
  -sSL \
  -o /usr/bin/docker-volume-plugin-dostorage \
  https://github.com/omallo/docker-volume-plugin-dostorage/releases/download/v0.4.0/docker-volume-plugin-dostorage_linux_amd64

sudo chmod +x /usr/bin/docker-volume-plugin-dostorage

sudo docker-volume-plugin-dostorage --access-token=$DIGITALOCEAN_TOKEN &

sudo systemctl restart docker

docker volume create --driver dostorage --name nextcloud-data-storage

docker run \
-d -p 80:80 -p 443:443 \
--volume nextcloud-data-storage:/var/www/html \
nextcloud

exit 0