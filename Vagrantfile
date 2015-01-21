Vagrant.configure('2') do |config|

  # Proxy Settings
  def configure_proxy(vm_def)
    if Vagrant.has_plugin?("vagrant-proxyconf")

      vm_def.proxy.http = ENV['http_proxy']
      vm_def.proxy.https = ENV['https_proxy']
      vm_def.apt_proxy.http = ENV['http_proxy']
      vm_def.apt_proxy.https = ENV['https_proxy']
      vm_def.proxy.no_proxy = ENV['no_proxy']
    end
  end

  vm_box = 'ubuntu/trusty64'

  # The Salt Master VM
  config.vm.define :saltmaster do |saltmaster|
    configure_proxy(saltmaster)
    saltmaster.vm.box = vm_box
    saltmaster.vm.box_check_update = true
    saltmaster.vm.network :private_network, ip: '192.168.37.10'
    saltmaster.vm.hostname = 'saltmaster'
    saltmaster.vm.provision :shell, path: "master_bootstrap.sh"
  end

  # The Minion VM
  config.vm.define :minion01 do |minion01|
    configure_proxy(minion01)
    minion01.vm.box = vm_box
    minion01.vm.box_check_update = true
    minion01.vm.network :private_network, ip: '192.168.37.11'
    minion01.vm.hostname = 'minion01'
    minion01.vm.provision :shell, path: "minion_bootstrap.sh"
  end

end
