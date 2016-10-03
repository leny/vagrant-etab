# leny/vagrant-etab
#
# /provision/40-nginx.sh - Vagrant provision script: nginx
#
# coded by leny@flatLand!
# started at 03/09/2016

apt-get install -y nginx-extras
cp /tmp/nginx/nginx.conf /etc/nginx/nginx.conf
cp /tmp/nginx/host.conf /etc/nginx/sites-available/default

service nginx restart
