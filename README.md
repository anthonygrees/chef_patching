# Chef Patching
[![Build Status](https://dev.azure.com/chef-sa/anthonygrees/_apis/build/status/Chef%20Patching%20Pipeline?branchName=master)](https://dev.azure.com/chef-sa/anthonygrees/_build/latest?definitionId=12&branchName=master)
  
### Overview
This cookbook is made to work with the Apprentice Chef training lab.  It will stand up the following:
- Linux node to be patched
- Windows WSUS Server
- Windows WSUS Client to be patched
  
Patching is triggered by tagging your Nodes using the ADO Pipeline and running `do_patch.sh` and you add the nodes to be tagged in the file `do_patch_node_list`
  
### Patching Work Flow
  
![Patching](/images/diagram.png)
  
### Setup
  1. Make sure that Port `8530` is open in the Security Group.
  
  2. Setup the WSUS server (This will take 30 mins)
     `kitchen converge wsus-server`

  3. Setup the clients to be patched
     a. Setup the Windows WSUS client
     `kitchen converge wsus-client-windows-2012-r2`

     b. Setup the Linux client
     `kitchen converge linux-ubuntu`
  
### Run the Demo

  
### References
I used the following code and information to create this repo
- https://github.com/chef-cft/patch_management/tree/jrm/update-patching-process
- https://github.com/chef-cft/wsus-demo
  
---
## License and Author

* Author:: Anthony Rees <anthony@chef.io>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


