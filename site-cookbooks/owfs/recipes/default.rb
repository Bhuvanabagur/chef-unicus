#
# Cookbook Name:: owfs
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

owfs_mount_point = '/mnt/owfs'

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

directory owfs_mount_point do
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

template '/sbin/mount.owfs' do
  owner 'root'
  group 'root'
  mode 0755
end

service 'owserver' do
  action :enable
  supports :start => true, :stop => true, :restart => true, :status => true
end

mount owfs_mount_point do
  action :enable
  device '/dev/i2c-1'
  fstype 'owfs'
  mount_point owfs_mount_point
  options 'allow_other'
  pass 0
end
