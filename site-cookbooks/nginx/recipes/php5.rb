#
# Cookbook Name:: nginx
# Recipe:: php5
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

package 'php5-fpm' do
  action :upgrade
end

package 'fcgiwrap' do
  action :upgrade
end

service 'php5-fpm' do
  action [:enable, :start]
  supports :start => true, :stop => true, :status => true, :restart => true, :reload => true
end

service 'fcgiwrap' do
  action [:enable, :start]
  supports :start => true, :stop => true, :status => true, :restart => true, :reload => true
end

template "/etc/php5/fpm/pool.d/www.conf" do
  owner 'root'
  group 'root'
  mode   0644

  notifies :restart, 'service[php5-fpm]'
end
