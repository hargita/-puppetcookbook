#!/bin/bash
sudo puppet apply /home/stefan/puppet/manifests/site.pp --modulepath /home/stefan/puppet/modules $*
