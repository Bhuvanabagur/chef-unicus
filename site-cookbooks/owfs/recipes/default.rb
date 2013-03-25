#
# Cookbook Name:: owfs
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

package 'owfs' do
  action :upgrade
end

package 'ow-shell' do
  action :upgrade
end

group 'fuse' do
  action :modify
  append true
  members 'pi'
end

directory '/mnt/owfs' do
  action :create
  owner 'root'
  group 'root'
  mode 0755
end

template '/etc/owfs.conf' do
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[owserver]'
end

service 'owserver' do
  action :enable
  supports :start => true, :stop => true, :restart => true, :status => true
end
