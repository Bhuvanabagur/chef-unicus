#
# Cookbook Name:: hostname
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

case node["cookbook-hostname"]["hostname"]
when "starfish"
  hosts_source_file = 'starfish.hosts.erb'
when /\Aichigo[0-9]{2}/
  hosts_source_file = 'ichigo.hosts.erb'
else
  raise RuntimeError.new("Unknown host: #{node["cookbook-hostname"]["hostname"]}")
end

template '/etc/hostname' do
  owner 'root'
  group 'root'
  mode 0644
end

template '/etc/hosts' do
  source hosts_source_file
  owner 'root'
  group 'root'
  mode 0644
end
