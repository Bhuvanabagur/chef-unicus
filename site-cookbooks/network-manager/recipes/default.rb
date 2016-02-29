#
# Cookbook Name:: network-manager
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

service "network-manager" do
  action [:start, :enable]
end
