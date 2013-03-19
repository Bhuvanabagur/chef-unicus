#
# Cookbook Name:: modprobe-config
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/modules" do
  owner "root"
  group "root"
  mode 0644
end
