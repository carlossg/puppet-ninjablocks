Vagrant.configure("2") do |config|

  config.vm.network "forwarded_port", guest: 8000, host: 8000

  config.vm.synced_folder ".", "/etc/puppet/modules/ninjablocks"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "tests"
    puppet.manifest_file  = "site.pp"
    puppet.module_path  = "spec/fixtures/modules"
    puppet.options = ["--verbose"]
  end

  config.vm.define :ubuntu do |config|
    config.vm.box = "Ubuntu-12.04"
    config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

    # Upgrade puppet to 3.3.1
    config.vm.provision "shell", inline: <<-EOS
      dpkg -s puppetlabs-release > /dev/null || ( wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb &&
        dpkg -i puppetlabs-release-precise.deb &&
        apt-get update )
      [[ `dpkg -s puppet | grep Version` =~ 3.3.1 ]] || apt-get dist-upgrade -y puppet facter puppet-common
      EOS
  end

  config.vm.define :debian do |config|
    config.vm.box = "Debian-7.1.0-amd64-netboot"
  end

end
