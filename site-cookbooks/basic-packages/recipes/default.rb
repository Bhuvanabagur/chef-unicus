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

development = %w|
binutils
strace
build-essential
libc6-dev
make
libnfs-dev
linux-tools
autotools-dev
git
manpages-dev
subversion
bison
cdbs
chrpath
diffstat
libbison-dev
libffi-dev
libgdbm-dev
libncurses5-dev
libncursesw5-dev
libreadline6-dev
libruby1.8
libtinfo-dev
libxss-dev
libyaml-dev
quilt
ruby1.8
tcl
tcl-dev
tcl8.5-dev
tk
tk-dev
tk8.5-dev
x11proto-scrnsaver-dev
libssl-dev
libexpat1-dev
libgl1-mesa-dev
libqt4-dev
|

misc        = ['lv',
               'bc',
               'mailutils',
               'vim',
               'tmux',
               'sysstat',
               'python-gpgme',
               'zsh',
               'graphviz']

storage = %w|
dosfstools
parted
smartmontools
|

[*networking,
 *development,
 *misc,
 *storage
].each do |p|
  package p do
    action :upgrade
  end
end
