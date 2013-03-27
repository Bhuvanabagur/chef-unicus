#
# Cookbook Name:: postfix
# Recipe:: starfish
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

template '/etc/postfix/master.cf' do
  source 'starfish/master.cf.erb'
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[postfix]'
end

template '/etc/postfix/main.cf' do
  source 'starfish/main.cf.erb'
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[postfix]'
end
