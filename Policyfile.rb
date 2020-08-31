# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'chef_patching'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'chef_patching::default'

# Specify a custom source for a single cookbook:
cookbook 'wsus-server', '~> 2.2.0', git: "https://github.com/criteo-cookbooks/wsus-server.git"
cookbook 'wsus-client', '~> 2.0.0', git: "https://github.com/criteo-cookbooks/wsus-client"
cookbook 'chef_patching', path: '.'
