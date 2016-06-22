
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = 'bento/centos-7.2'
  config.omnibus.chef_version = :latest

  config.vm.define 'centos-7.2_ruby-2.3.1' do |dev_env|
    dev_env.vm.provision 'chef_zero' do |chef|
      chef.node_name = 'vagrant-centos-7.2_ruby-2.3.1'

      chef.cookbooks_path = './cookbooks'
      chef.roles_path = './roles'
      chef.nodes_path = './nodes'

      chef.json = {
        rbenv: {
          user_installs: [
            {
              user: "vagrant",
              global: "2.3.1"
            }
          ]
        }
      }

      chef.add_role 'ruby_231'
    end
  end
end
