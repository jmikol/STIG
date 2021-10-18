#!/usr/bin/env bash

# git clone https://github.com/ansible-lockdown/RHEL7-STIG.git

# $ cat ~/.ssh/config
# Host centos
#   HostName 192.168.33.10
#   User vagrant
#   Port 22
#   UserKnownHostsFile /dev/null
#   StrictHostKeyChecking no
#   PasswordAuthentication no
#   IdentityFile /Users/joe/centos/.vagrant/machines/default/virtualbox/private_key
#   IdentitiesOnly yes
#   LogLevel FATAL

# $ ssh centos
# $ sudo -Es
# $ grub2-setpassword
# $ cat /boot/grub2/user.cfg
# $ exit

# GRUB2_PASSWORD=<copied from previous command in VM>

INVENTORY="centos,"
EXTRA_VARS="rhel7stig_bootloader_password_hash=$GRUB2_PASSWORD"
PLAYBOOK="RHEL7-STIG/site.yml"

ansible-playbook --inventory $INVENTORY --ask-become-pass --extra-vars "$EXTRA_VARS" $PLAYBOOK
