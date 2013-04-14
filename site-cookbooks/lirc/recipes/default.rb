#
# Cookbook Name:: lirc
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

package 'lirc' do
  action :upgrade
end

template '/etc/lirc/lircd.conf' do
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[lirc]'
end

template '/etc/lirc/hardware.conf' do
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[lirc]'
end

service 'lirc' do
  action :enable
  supports :start => true, :stop => true, :restart => true, :status => true
end
