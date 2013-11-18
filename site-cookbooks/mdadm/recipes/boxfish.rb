#
# Cookbook Name:: mdadm
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'mdadm' do
  action :upgrade
end

service 'mdadm' do
  action :enable
  supports :start => true, :stop => true, :restart => true
end

template '/etc/mdadm/mdadm.conf' do
  owner 'root'
  group 'root'
  mode   0644

  notifies :restart, 'service[mdadm]'
end
