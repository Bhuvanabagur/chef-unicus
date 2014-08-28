#
# Cookbook Name:: nginx
# Recipe:: sites
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

template '/etc/nginx/sites-available/default' do
  source 'default.erb'
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, 'service[nginx]'
end

# template '/etc/nginx/conf.d/proxy.conf' do
#   owner 'root'
#   group 'root'
#   mode 0644
# 
#   notifies :restart, 'service[nginx]'
# end
