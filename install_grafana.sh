#!/bin/bash
set -e

echo "deb https://packagecloud.io/grafana/stable/debian/ wheezy main" >> /etc/apt/sources.list.d/grafana.list
curl https://packagecloud.io/gpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install grafana

grep '{' ./grafana/custom.ini > /dev/null
if [[ $? != 1 ]]; then
	echo "Looks like theres still some config to setup in ./grafana/custom.ini"
	exit 1
fi

ln -sf ./grafana/custom.ini /usr/share/grafana/conf/custom.ini

