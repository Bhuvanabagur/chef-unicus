#
# Cookbook Name:: rsyslog
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'rsyslog' do
  action :upgrade
end

template '/etc/rsyslog.conf' do
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[rsyslog]'
end

template '/etc/rsyslog.d/50-default.conf' do
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[rsyslog]'
end

service 'rsyslog' do
  action [:enable]
  supports :start => true, :stop => true, :restart => true, :reload => true
end
