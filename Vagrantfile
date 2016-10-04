# leny/vagrant-etab
#
# /Vagrantfile - Vagrant configuration file
#
# coded by leny@flatLand!
# started at 02/09/2016

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'" # cf. https://github.com/mitchellh/vagrant/issues/1673#issuecomment-28288042

  config.vm.provider "virtualbox" do |vb|
    vb.name = "vagrant-etab"
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
  end

  config.vm.provision "shell", name: "Update System", path: "provision/00-update-system.sh", keep_color: true

  config.vm.provision "shell", name: "Install Node.js", path: "provision/10-nodejs.sh", keep_color: true

  config.vm.provision "shell", name: "Install MongoDB", path: "provision/20-mongodb.sh", keep_color: true

  config.vm.provision "shell", name: "Install Redis", path: "provision/30-redis.sh", keep_color: true

  config.vm.provision "file", source: "provision/nginx/nginx.conf", destination: "/tmp/nginx/nginx.conf"
  config.vm.provision "file", source: "provision/nginx/host.conf", destination: "/tmp/nginx/host.conf"
  config.vm.provision "shell", name: "Install & configure nginx", path: "provision/40-nginx.sh", keep_color: true

  config.vm.provision "shell", name: "Add aliases", path: "provision/50-aliases.sh", keep_color: true

  # this must be run only when packaging
  config.vm.provision "shell", name: "Cleaning VM for packaging", path: "provision/60-cleaning.sh", keep_color: true
end
