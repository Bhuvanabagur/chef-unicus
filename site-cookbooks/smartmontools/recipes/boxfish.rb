#
# Cookbook Name:: smartmontools
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'smartmontools' do
  action :upgrade
end

template '/etc/default/smartmontools' do
  owner 'root'
  group 'root'
  mode   0644

  notifies :restart, 'service[smartd]'
end

template '/etc/smartd.conf' do
  owner 'root'
  group 'root'
  mode   0644

  notifies :restart, 'service[smartd]'
end

service 'smartd' do
  action :enable
  supports :start => true, :stop => true, :restart => true
end
