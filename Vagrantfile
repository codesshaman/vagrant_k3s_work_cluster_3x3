# -*- mode: ruby -*-
# vi: set ft=ruby :

# machines config
MEM = 1024
CPU = 1

# create machines config
Vagrant.configure("2") do |master_config|
	config.vm.box = "bento/debian-11"
	config.vm.provider "virtualbox" do |v|
		v.memory = MEM
		v.cpus = CPU
		# for connect with SSH on both machines with no password
		id_rsa_pub = File.read("#{Dir.home}/.ssh/id_rsa.pub")
  		config.vm.provision "copy ssh public key", type: "shell",
    	  inline: "echo \"#{id_rsa_pub}\" >> /home/vagrant/.ssh/authorized_keys"

	config.vm.box = "bento/debian-11"
	config.vm.provider "virtualbox" do |v|
		v.memory = MEM
		v.cpus = CPU
	end

  # first master node config
	config.vm.define 'master1' do |master|
		master.vm.hostname = 'master1'
		master.vm.network :private_network, ip: MASTER_NODE_1
		# configure shared folder
		master.vm.synced_folder ".", "/mnt", type: "virtualbox"
		# run script for master node with argument
		master.vm.provision "shell", privileged: true, path: "first_master_node_setup.sh", args: '192.168.56.10'
		config.vm.network "forwarded_port", guest: 6443, host: 6443, protocol: "tcp"
		config.vm.network "forwarded_port", guest: 8472, host: 8472, protocol: "udp"
		config.vm.network "forwarded_port", guest: 51820, host: 51820, protocol: "udp"
		config.vm.network "forwarded_port", guest: 51821, host: 51821, protocol: "udp"
		config.vm.network "forwarded_port", guest: 10250, host: 10250, protocol: "tcp"
		config.vm.network "forwarded_port", guest: 2379, host: 2379, protocol: "tcp"
		config.vm.network "forwarded_port", guest: 2380, host: 2380, protocol: "tcp"
		master.vm.provider "virtualbox" do |v|
			v.name = 'master1'
		end
	end
  
  # second master node config
	config.vm.define 'master2' do |master|
		master.vm.hostname = 'master2'
		master.vm.network :private_network, ip: MASTER_NODE_2
		# configure shared folder
		master.vm.synced_folder ".", "/mnt", type: "virtualbox"
		# run script for master node with argument
		master.vm.provision "shell", privileged: true, path: "master_node_setup.sh", args: '192.168.56.20'
		config.vm.network "forwarded_port", guest: 6443, host: 6443, protocol: "tcp"
		config.vm.network "forwarded_port", guest: 8472, host: 8472, protocol: "udp"
		config.vm.network "forwarded_port", guest: 51820, host: 51820, protocol: "udp"
		config.vm.network "forwarded_port", guest: 51821, host: 51821, protocol: "udp"
		config.vm.network "forwarded_port", guest: 10250, host: 10250, protocol: "tcp"
		config.vm.network "forwarded_port", guest: 2379, host: 2379, protocol: "tcp"
		config.vm.network "forwarded_port", guest: 2380, host: 2380, protocol: "tcp"
		master.vm.provider "virtualbox" do |v|
			v.name = 'master2'
		end
	end
  
  # third master node config
	config.vm.define 'master3' do |master|
		master.vm.hostname = 'master3'
		master.vm.network :private_network, ip: MASTER_NODE_3
		# configure shared folder
		master.vm.synced_folder ".", "/mnt", type: "virtualbox"
		# run script for master node with argument
		master.vm.provision "shell", privileged: true, path: "master_node_setup.sh", args: '192.168.56.30'
		config.vm.network "forwarded_port", guest: 6443, host: 6443, protocol: "tcp"
		config.vm.network "forwarded_port", guest: 8472, host: 8472, protocol: "udp"
		config.vm.network "forwarded_port", guest: 51820, host: 51820, protocol: "udp"
		config.vm.network "forwarded_port", guest: 51821, host: 51821, protocol: "udp"
		config.vm.network "forwarded_port", guest: 10250, host: 10250, protocol: "tcp"
		config.vm.network "forwarded_port", guest: 2379, host: 2379, protocol: "tcp"
		config.vm.network "forwarded_port", guest: 2380, host: 2380, protocol: "tcp"
		master.vm.provider "virtualbox" do |v|
			v.name = 'master3'
		end
	end

  # worker node config
	config.vm.define 'worker1' do |worker|
		worker.vm.hostname = 'worker1'
		worker.vm.network :private_network, ip: WORKER_NODE_1
		# configure shared folder
		worker.vm.synced_folder ".", "/mnt", type: "virtualbox"
		# run script for worker node with arguments
		worker.vm.provision "shell", privileged: true, path: "worker_node_setup.sh", args: ['192.168.56.10', '192.168.56.110']
		worker.vm.provider "virtualbox" do |v|
			v.name = 'worker1'
		end
	end
  
  # worker node config
	config.vm.define 'worker2' do |worker|
		worker.vm.hostname = 'worker2'
		worker.vm.network :private_network, ip: WORKER_NODE_2
		# configure shared folder
		worker.vm.synced_folder ".", "/mnt", type: "virtualbox"
		# run script for worker node with arguments
		worker.vm.provision "shell", privileged: true, path: "worker_node_setup.sh", args: ['192.168.56.10', '192.168.56.120']
		worker.vm.provider "virtualbox" do |v|
			v.name = 'worker2'
		end
	end
  
  # worker node config
	config.vm.define 'worker3' do |worker|
		worker.vm.hostname = 'worker3'
		worker.vm.network :private_network, ip: WORKER_NODE_3
		# configure shared folder
		worker.vm.synced_folder ".", "/mnt", type: "virtualbox"
		# run script for worker node with arguments
		worker.vm.provision "shell", privileged: true, path: "worker_node_setup.sh", args: ['192.168.56.10', '192.168.56.130']
		worker.vm.provider "virtualbox" do |v|
			v.name = 'worker3'
		end
	end
end
