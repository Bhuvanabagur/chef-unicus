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
