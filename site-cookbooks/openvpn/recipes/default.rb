#
# Cookbook Name:: openvpn
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w|openvpn openssl|.each do |p|
  package p do
    action :upgrade
  end
end


# IP foward setting

cookbook_file "/etc/sysctl.d/99-ip-forward.conf" do
  owner 'root'
  group 'root'
  mode 0644
end

script "set runtime ip_forward" do
  interpreter 'bash'
  not_if "test `cat /proc/sys/net/ipv4/ip_forward` = '0'"
  action :run
  user 'root'
  code "echo 1 > /proc/sys/net/ipv4/ip_forward"
end


# ovpn setting

%w|/etc/openvpn/ca.crt /etc/openvpn/server.crt /etc/openvpn/dh1024.pem|.each do |file|
  cookbook_file file do
    owner 'root'
    group 'root'
    mode 0644
  end
end

file "/etc/openvpn/server.key" do
  action :create
  backup 3
  owner 'root'
  group 'root'
  mode 0600
  content Chef::EncryptedDataBagItem.load('starfish-openvpn', 'server_key')['content']
end

template "/etc/openvpn/server.conf" do
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, "service[openvpn]"
end

service "openvpn" do
  action :enable
  supports :start => true, :stop => true, :reload => true, :restart => true, :status => true
end
