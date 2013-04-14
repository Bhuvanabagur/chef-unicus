#
# Cookbook Name:: basic-packages
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

networking  = ['hping3']
development = ['binutils', 'strace', 'build-essential', 'make', 'libnfs-dev',
               'linux-tools', 'autotools-dev']
misc        = ['lv', 'bc', 'mailutils', 'vim', 'tmux']

[*networking,
 *development,
 *misc
].each do |p|
  package p do
    action :upgrade
  end
end
