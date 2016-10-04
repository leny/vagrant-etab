# leny/vagrant-etab
#
# /provision/30-redis.sh - Vagrant provision script: Redis
#
# coded by leny@flatLand!
# started at 02/09/2016

cd /tmp
curl -O http://download.redis.io/redis-stable.tar.gz
tar xzvf redis-stable.tar.gz
cd redis-stable

make
make test
make install

mkdir /etc/redis
cp /tmp/redis-stable/redis.conf /etc/redis
sed -e "s/supervised no/supervised systemd/g" -i /etc/redis/redis.conf
sed -e "s/bind 127.0.0.1/bind 0.0.0.0/g" -i /etc/redis/redis.conf
sed -e "s/dir .\//dir \/var\/lib\/redis/g" -i /etc/redis/redis.conf

echo -en "
[Unit]
Description=Redis In-Memory Data Store
After=network.target

[Service]
User=redis
Group=redis
ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
ExecStop=/usr/local/bin/redis-cli shutdown
Restart=always

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/redis.service

adduser --system --group --no-create-home redis
mkdir /var/lib/redis
chown redis:redis /var/lib/redis
chmod 770 /var/lib/redis

systemctl restart redis
systemctl enable redis
