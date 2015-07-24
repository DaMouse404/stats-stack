#!/bin/bash
set -e

sed -i "s/Listen 80/#Listen 80/g" /etc/apache2/ports.conf

apt-get install -y nginx

ln -fs ./nginx/grafana.conf /etc/nginx/sites-enabled/grafana.conf

