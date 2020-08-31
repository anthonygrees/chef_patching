include_recipe 'wsus-client::configure'

wsus_client_update 'WSUS updates' do
  handle_reboot true
end