#
# Cookbook Name:: mountpoints
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/export/home1" do
  owner 'root'
  group 'root'
  recursive true
end

mount "/export/home1" do
  action [:enable, :mount]
  device '7b964c42-2a1e-4ddb-b113-2df8aee88fea' # /dev/md1
  device_type :uuid
  fstype 'ext4'
  options 'errors=remount-ro'
  pass 2
end
