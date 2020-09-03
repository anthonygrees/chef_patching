#
# Cookbook:: bjc_linux_bootstrap
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

bash 'Do some chef pre-work' do
    code <<-EOH
#!/bin/bash -xev
/bin/mkdir -p /etc/chef
/bin/mkdir -p /var/lib/chef
/bin/mkdir -p /var/log/chef
EOH
end

bash 'Create client.rb' do
    code <<-EOH
YOUR_NAME='Patch'
NODE_NAME=Ubuntu-${YOUR_NAME}-$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 4 | head -n 1)
/bin/echo 'log_location     STDOUT' >> /etc/chef/client.rb
/bin/echo -e "chef_server_url 'https://#{node['environment']['automate_url']}/organizations/#{node['environment']['chef_org']}'" >> /etc/chef/client.rb
/bin/echo -e "validation_key '/tmp/kitchen/cookbooks/chef_patching/recipes/validator.pem'" >> /etc/chef/client.rb
/bin/echo -e "node_name '${NODE_NAME}'" >> /etc/chef/client.rb
/bin/echo -e "ssl_verify_mode :verify_none" >> /etc/chef/client.rb
/bin/echo -e "policy_group 'development'" >> /etc/chef/client.rb
/bin/echo -e "policy_name 'patching'" >> /etc/chef/client.rb
sudo chef-client
EOH
not_if { ::File.exist?('/etc/chef/client.rb') }
end

bash 'apt-get update' do
    code <<-EOH
sudo apt-get update -y
EOH
end