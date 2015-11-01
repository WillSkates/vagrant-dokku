Vagrant.configure("2") do |config|

	config.vm.box = "ubuntu/trusty64"
	config.ssh.insert_key = false
    config.vm.provision "shell", path: "install.sh"

    config.vm.network "private_network", ip: "192.168.50.2"

end