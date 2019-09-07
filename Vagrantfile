Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.5"
  config.vm.network :forwarded_port, guest: 80, host: 4567, auto_correct: true
  config.vm.network "private_network", ip: "172.28.128.12"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
end
