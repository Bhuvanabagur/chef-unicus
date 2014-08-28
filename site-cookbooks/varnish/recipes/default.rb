#
# Cookbook Name:: varnish
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'varnish' do
  action :upgrade
end

service 'varnish' do
  action :enable
  supports :start => true, :stop => true, :restart => true
end

template '/etc/varnish/default.vcl' do
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[varnish]'
end

template '/etc/default/varnish' do
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[varnish]'
end
