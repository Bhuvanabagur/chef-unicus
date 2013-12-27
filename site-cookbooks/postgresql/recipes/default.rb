#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

template '/etc/apt/sources.list.d/pgdg.list' do
  owner 'root'
  group 'root'
  mode 0644

  notifies :run, 'script[add key]', :immediately
end

script 'add key' do
  action :nothing
  interpreter 'bash'
  user 'root'
  code <<-EOS
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
apt-get update
EOS
end

package 'postgresql-9.2' do
  action :upgrade
end

package 'libpq-dev' do
  action :upgrade
end

service 'postgresql' do
  action [:enable, :start]
  supports :start => true, :stop => true, :restart => true, :status => true
end
