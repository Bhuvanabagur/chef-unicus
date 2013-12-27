#
# Cookbook Name:: vncserver
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'vnc4server' do
  action :upgrade
end

package 'x11vnc' do
  action :upgrade
end

