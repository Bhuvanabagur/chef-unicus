#
# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'iptables' do
  action :upgrade
end

template '/etc/network/if-pre-up.d/iptables-up' do
  source 'iptables-up.erb'

  owner 'root'
  group 'root'
  mode 0755

  notifies :restart, "service[networking]"
end

template '/etc/network/if-post-down.d/iptables-down' do
  source 'iptables-down.erb'

  owner 'root'
  group 'root'
  mode 0755

  notifies :restart, "service[networking]"
end

service 'networking' do
  action :nothing
  supports :start => true, :stop => true, :reload => true, :restart => true
end
