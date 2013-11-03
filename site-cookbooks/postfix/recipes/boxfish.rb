#
# Cookbook Name:: postfix
# Recipe:: boxfish
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

template '/etc/postfix/master.cf' do
  source 'boxfish/master.cf.erb'
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[postfix]'
end

template '/etc/postfix/main.cf' do
  source 'boxfish/main.cf.erb'
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[postfix]'
end

template '/etc/postfix/transport' do
  source 'boxfish/transport.erb'
  owner 'root'
  group 'root'
  mode 0644

  notifies :run, 'script[hash-transport-map]', :immediately
  notifies :restart, 'service[postfix]'
end

template '/etc/postfix/authinfo' do
  source 'boxfish/authinfo.erb'
  owner 'root'
  group 'root'
  mode 0600

  notifies :run, 'script[hash-authinfo]', :immediately
  notifies :restart, 'service[postfix]'
end

script 'hash-transport-map' do
  action :nothing
  interpreter "bash"
  user "root"

  code <<-EOS
  postmap /etc/postfix/transport
  EOS
end

script 'hash-authinfo' do
  action :nothing
  interpreter "bash"
  user "root"

  code <<-EOS
  postmap /etc/postfix/authinfo
  EOS
end
