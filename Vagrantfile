# leny/vagrant-etab
#
# /Vagrantfile - Vagrant configuration file
#
# coded by leny@flatLand!
# started at 02/09/2016

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "vagrant-etab"
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
  end

  config.vm.provision "shell", path: "provision/00-update-system.sh", keep_color: true

  config.vm.provision "shell", path: "provision/10-nodejs.sh", keep_color: true

  config.vm.provision "shell", path: "provision/20-mongodb.sh", keep_color: true

  config.vm.provision "shell", path: "provision/30-redis.sh", keep_color: true

  config.vm.provision "file", source: "provision/nginx/nginx.conf", destination: "/tmp/nginx/nginx.conf"
  config.vm.provision "file", source: "provision/nginx/host.conf", destination: "/tmp/nginx/host.conf"
  config.vm.provision "shell", path: "provision/40-nginx.sh", keep_color: true

  config.vm.provision "shell", path: "provision/50-aliases.sh", keep_color: true
end
