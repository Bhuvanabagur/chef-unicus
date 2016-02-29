#
# Cookbook Name:: vncserver
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'vnc4server' do
  action :upgrade
end

package 'x11vnc' do
  action :upgrade
end

template '/etc/xinetd.d/vncserver' do
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[xinetd]'
end

template '/etc/services' do
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[xinetd]'
end

template '/etc/gdm3/daemon.conf' do
  owner 'root'
  group 'root'
  mode 0644

  # notifies :restart, 'service[gdm3]'
end


service 'xinetd' do
  action [:enable, :start]
  supports :start => true, :stop => true, :restart => true, :reload => true, :status => true
end

service 'gdm3' do
  action [:enable, :start]
  supports :start => true, :stop => true, :restart => true, :reload => true, :status => true
end
