# leny/vagrant-etab
#
# /provision/30-redis.sh - Vagrant provision script: Redis
#
# coded by leny@flatLand!
# started at 02/09/2016

apt-get install -y redis-server

sed -e "s/supervised no/supervised systemd/g" -i /etc/redis/redis.conf
sed -e "s/bind 127.0.0.1/bind 0.0.0.0/g" -i /etc/redis/redis.conf
sed -e "s/dir .\//dir \/var\/lib\/redis/g" -i /etc/redis/redis.conf

adduser --system --group --no-create-home redis
mkdir /var/lib/redis
chown redis:redis /var/lib/redis
chmod 770 /var/lib/redis

service redis-server restart
