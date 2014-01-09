#
# Cookbook Name:: ntpd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "ntp" do
  action :upgrade
end

service "ntp" do
  action :enable
  supports :start => true, :stop => true, :restart => true
end
