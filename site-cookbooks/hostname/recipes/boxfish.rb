#
# Cookbook Name:: hostname
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

template '/etc/hostname' do
  owner 'root'
  group 'root'
  mode 0644
end

template '/etc/hosts' do
  owner 'root'
  group 'root'
  mode 0644
end
