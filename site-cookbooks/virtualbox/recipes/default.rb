#
# Cookbook Name:: virtualbox
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template '/tmp/oracle_vbox.asc' do
end

template '/etc/apt/sources.list.d/vbox.list' do
  owner 'root'
  group 'root'
  mode   0644

  notifies :run, 'execute[apt vbox]'
end

execute 'apt vbox' do
  action :nothing

  user 'root'
  command 'apt-key add /tmp/oracle_vbox.asc; apt-get update'
end

package 'virtualbox-4.3' do
  action :install
end

package 'linux-headers-3.2.0-4-amd64' do
  action :upgrade
end
