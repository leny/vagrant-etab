# leny/vagrant-etab
#
# /provision/40-nginx.sh - Vagrant provision script: nginx
#
# coded by leny@flatLand!
# started at 03/09/2016

apt-get install -y nginx-extras
cp /tmp/nginx/nginx.conf /etc/nginx/nginx.conf
cp /tmp/nginx/host.conf /etc/nginx/sites-available/default

mkdir /etc/nginx/ssl
echo "Generate self-signed certificate (this can take time)…"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=BE/L=Liège/O=flatLand\!/CN=flatland.be" -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt 2> /dev/null
openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048 2> /dev/null
echo "…done."

service nginx restart
