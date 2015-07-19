#!/bin/bash
set -e

ROOT=$PWD

apt-get install -y nodejs devscripts debhelper npm

DIR=`mktemp -d`
mkdir -p $DIR/src
git clone https://github.com/etsy/statsd.git $DIR/src

cd $DIR/src
dpkg-buildpackage
cd $DIR

#because NPM Packages are dumb
ln -fs /usr/bin/nodejs /usr/bin/node

service carbon-cache stop || true

dpkg -i statsd*.deb
 
service statsd stop || true

service carbon-cache start

ln -fs $ROOT/statsd/localConfig.js /etc/statsd/localConfig.js

service statsd start
