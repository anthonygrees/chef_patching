#
# Cookbook:: chef_patching
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# Platform specific settings
case node['platform']
when 'windows'
  # Windows platforms
  include_recipe 'chef_patching::windows_patch'

else
  # Linux platforms
  include_recipe 'chef_patching::linux_patch'

end