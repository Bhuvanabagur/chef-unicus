#
# Cookbook Name:: basic-packages
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

networking  = ['hping3',
               'curl',
               'tcpdump']
development = ['binutils',
               'strace',
               'build-essential',
               'make',
               'libnfs-dev',
               'linux-tools',
               'autotools-dev',
               'git',
               'manpages-dev']
misc        = ['lv',
               'bc',
               'mailutils',
               'vim',
               'tmux',
               'sysstat']
storage = ['dosfstools',
           'parted']

[*networking,
 *development,
 *misc,
 *storage
].each do |p|
  package p do
    action :upgrade
  end
end
