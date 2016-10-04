# leny/vagrant-etab
#
# /provision/60-cleaning.sh - Vagrant provision script: cleaning VM before packaging
#
# coded by leny@flatLand!
# started at 04/09/2016

apt-get clean

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

cat /dev/null > ~/.bash_history
history -c

exit
