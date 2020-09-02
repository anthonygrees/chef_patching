# Specify the free storage for a partition in GB
default['chef_patching']['var_partition_min_diskspace_required_in_GB'] = 1

# WSUS
default['wsus_server']['synchronize']['timeout'] = 0
default['wsus_server']['subscription']['configure_timeout']             = 2000
# Defines the list of categories of updates that you want the WSUS server to synchronize. (Id or Title)
default['wsus_server']['subscription']['categories']                    = [
                                                                          'Windows Server 2012 R2  and later drivers',
                                                                          'Windows Server 2012 R2 Drivers',
                                                                          'Windows Server 2012 R2 Language Packs',
                                                                          'Windows Server 2012 R2',
                                                                          ]
# Defines the list of classifications of updates that you want the WSUS server to synchronize. (Id or Title)
default['wsus_server']['subscription']['classifications']               = ['Critical Updates',
                                                                           'Security Updates']
default['wsus_server']['freeze']['name'] = 'My Server Group'

# Defines whether a custom WSUS server should be used instead of Microsoft Windows Update server.
default['wsus_client']['wsus_server']                              = 'http://52.176.0.85:8530'

# Defines the current computer update group.
# => Truthy value also enable client-side update group targeting.
default['wsus_client']['update_group']                             = 'My Server Group'
default['wsus_client']['no_reboot_with_logged_users']              = false
default['wsus_client']['update']['handle_reboot']                  = true