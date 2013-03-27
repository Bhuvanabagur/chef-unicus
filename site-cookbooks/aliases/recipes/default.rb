#
# Cookbook Name:: aliases
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

template '/etc/aliases' do
  owner 'root'
  group 'root'
  mode 0644

  notifies :run, 'script[update aliases]'
end

script 'update aliases' do
  interpreter 'bash'
  action :nothing
  user 'root'
  code "newaliases"
end
