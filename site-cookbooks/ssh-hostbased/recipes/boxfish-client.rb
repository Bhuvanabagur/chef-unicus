#
# Cookbook Name:: ssh-hostbased
# Recipe:: boxfish-client
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "generate host key" do
  not_if { ::File.exists?("/etc/ssh/ssh_host_rsa_key") }

  user 'root'
  command " ssh-keygen -t rsa -N '' -f /etc/ssh/ssh_host_rsa_key"
end

template "/etc/ssh/ssh_config" do
  source 'boxfish/ssh_config.erb'
  owner 'root'
  group 'root'
  mode   0644
end
