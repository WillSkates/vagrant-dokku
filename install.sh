#!/bin/bash

# Install the aufs filesystem.
apt-get install -y lxc wget bsdtar curl
apt-get install -y linux-image-extra-$(uname -r)
modprobe aufs

# Installing our PaaS and the plug ins that we need.
mkdir /etc/update-motd.d
wget https://raw.githubusercontent.com/progrium/dokku/v0.4.3/bootstrap.sh
DOKKU_TAG=v0.4.3 bash bootstrap.sh
dokku plugin:install https://github.com/dokku/dokku-mysql.git
dokku plugin:install https://github.com/dokku/dokku-postgres.git
dokku plugin:install https://github.com/dokku/dokku-mongo.git
dokku plugin:install https://github.com/dokku/dokku-memcached.git
dokku plugin:install https://github.com/dokku/dokku-redis.git
dokku plugin:install https://github.com/josegonzalez/dokku-volume.git
curl -s https://shipyard-project.com/deploy | bash -s