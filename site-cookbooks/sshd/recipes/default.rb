#
# Cookbook Name:: sshd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'openssh-server' do
  action :upgrade

  notifies :restart, 'service[ssh]'
end

template '/etc/ssh/sshd_config' do
  owner 'root'
  group 'root'
  mode 0644

  notifies :reload, 'service[ssh]'
end

service 'ssh' do
  action :enable
  supports :start => true, :stop => true, :reload => true, :restart => true, :status => true
end
