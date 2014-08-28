#
# Cookbook Name:: networking
# Recipe:: ichigo
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

unless !node['ipaddr'] || node['ipaddr'] =~ /\d+(\.\d+)/
  raise RuntimeError.new("Valid IP address is not supplied: #{node['ipaddr'].inspect}")
end

unless !node['subnet'] || node['subnet'] =~ /\d+(\.\d+)/
  raise RuntimeError.new("Valid IP address is not supplied: #{node['subnet'].inspect}")
end

unless !node['gateway'] || node['gateway'] =~ /\d+(\.\d+)/
  raise RuntimeError.new("Valid IP address is not supplied: #{node['gateway'].inspect}")
end

template '/etc/network/interfaces' do
  owner 'root'
  group 'root'
  mode 0644

  # notifies :restart, 'service[networking]'
end

service 'networking' do
  action :enable
  supports :start => true, :stop => true, :restart => true
end

