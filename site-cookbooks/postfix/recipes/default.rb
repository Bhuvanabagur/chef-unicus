#
# Cookbook Name:: postfix
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

package 'postfix' do
  action :upgrade
end

service 'postfix' do
  action [:enable, :start]
  supports :start => true, :stop => true, :restart => true, :reload => true, :status => true
end
