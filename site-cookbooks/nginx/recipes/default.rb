#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

package 'apache2' do
  action :remove
end

package 'nginx-full' do
  action :upgrade
end

directory '/var/cache/nginx/unicus.dip.jp' do
  action :create
  recursive true
end

service 'nginx' do
  action [:enable, :start]
  supports :start => true, :stop => true, :restart => true, :reload => true, :status => true
end
