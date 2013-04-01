#
# Cookbook Name:: resque
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

gem_package 'resque' do
  action :install
  version '1.24.1'
end

gem_package 'thin' do
  action :install
end

template '/etc/init.d/resque-web' do
  owner 'root'
  group 'root'
  mode 0755
end

service 'resque-web' do
  action [:enable, :start]
  supports :start => true, :stop => true, :restart => true, :status => true
end
