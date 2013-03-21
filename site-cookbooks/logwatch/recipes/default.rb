#
# Cookbook Name:: logwatch
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

package 'logwatch' do
  action :upgrade
end

template '/etc/logwatch/conf/logwatch.conf' do
  owner 'root'
  group 'root'
  mode 0644
end

directory '/var/cache/logwatch' do
  owner 'root'
  group 'root'
  mode 0755
end
