#!/bin/bash

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y graphite-web graphite-carbon

ln -fs $PWD/carbon /etc/carbon
ln -fs $PWD/graphite/graphite-carbon /etc/default/
ln -fs $PWD/graphite/local_settings.py /etc/graphite/local_settings.py

service carbon-cache start

apt-get install -y apache2 libapache2-mod-wsgi

a2dissite 000-default
ln -fs $PWD/graphite/apache2-graphite.conf /etc/apache2/sites-available
a2ensite apache2-graphite
a2enmod headers

echo "Listen 2005" >> /etc/apache2/ports.conf

service apache2 reload

graphite-manage syncdb --noinput
