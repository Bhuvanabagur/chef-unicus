#
# Cookbook Name:: nagios
# Recipe:: ichigo
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

package 'nagios-plugins-basic' do
  action :upgrade
end

file '/usr/lib/nagios/plugins/check_disk' do
  owner 'root'
  group 'root'
  mode 0755
end
