#
# Cookbook Name:: bluetooth
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

pkgs = %w!
bluez-utils
gnome-bluetooth
!

[*pkgs].each do |p|
  package p do
    action :upgrade
  end
end

service 'bluetooth' do
  action [:enable, :start]
  supports :start => true, :stop => true, :status => true, :restart => true
end

template "/etc/bluetooth/rfcomm.conf" do
  owner 'root'
  group 'root'
  mode   0644

  notifies :restart, 'service[bluetooth]'
end

