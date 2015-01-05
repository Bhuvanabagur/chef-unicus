#
# Cookbook Name:: influxdb
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/tmp/influxdb_latest_amd64.deb" do
  action :create
  notifies :install, "dpkg_package[influxdb_latest_amd64.deb]"
end

dpkg_package "influxdb_latest_amd64.deb" do
  action :nothing
  provider Chef::Provider::Package::Dpkg
  source "/tmp/influxdb_latest_amd64.deb"
end

service "influxdb" do
  action [:enable, :start]
  supports :start => true, :stop => true, :restart => true, :status => true
end
