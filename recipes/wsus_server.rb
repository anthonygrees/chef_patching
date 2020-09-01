#
# Bootstrap
#
powershell_script 'Create config.rb' do
  code <<-EOH
  $nodeName = "WSUS-Server-{0}" -f (-join ((65..90) + (97..122) | Get-Random -Count 4 | % {[char]$_}))
  
  $clientrb = @"
chef_server_url 'https://#{node['environment']['automate_url']}/organizations/#{node['environment']['chef_org']}'
validation_key 'C:\\Users\\Administrator\\AppData\\Local\\Temp\\kitchen\\cookbooks\\chef_patching\\recipes\\validator.pem'
node_name '{0}'
policy_group 'development'
policy_name 'base_windows2012_detect'
ssl_verify_mode :verify_none
chef_license 'accept'
"@ -f $nodeName
  
  Set-Content -Path c:\\chef\\client.rb -Value $clientrb
  EOH
end
  
powershell_script 'Run Chef' do
  code <<-EOH
  ## Run Chef
  C:\\opscode\\chef\\bin\\chef-client.bat
  EOH
end

#
# Cookbook:: wsus
# Recipe:: server
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'wsus-server::default'
include_recipe 'wsus-server::freeze'