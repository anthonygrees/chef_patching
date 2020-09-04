# Chef Patching
[![Build Status](https://dev.azure.com/chef-sa/anthonygrees/_apis/build/status/Chef%20Patching%20Pipeline?branchName=master)](https://dev.azure.com/chef-sa/anthonygrees/_build/latest?definitionId=12&branchName=master)
  
## Overview
This cookbook is made to work with the Apprentice Chef training lab.  It will stand up the following:
- Linux node to be patched
- Windows WSUS Server
- Windows WSUS Client to be patched
  
Patching is triggered by tagging your Nodes using the ADO Pipeline and running `do_patch.sh` and you add the nodes to be tagged in the file `do_patch_node_list`
  
## Diagram
  
![Patching](/images/diagram.png)
  
## Setup





