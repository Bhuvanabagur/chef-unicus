#
# Cookbook Name:: mount
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

# haya_dir = '/suzuki/haya'

# # make mount point
# [haya_dir].each do |dir|
#   directory dir do
#     action :create
#     owner "root"
#     group "root"
#     mode 0755
#     recursive true
#   end
# end

#
# disable nfs mount by fstab
#
# mount "suzuki haya" do
#   action :disable
#   device '192.168.0.100:/haya'
#   fstype 'nfs'
#   mount_point haya_dir
#   options 'rw,bg,hard,intr,rsize=4096,wsize=4096,timeo=300,nolock'
#   pass 0
# end


package "autofs" do
  action :upgrade
end

directory "/etc/auto.master.d" do
  action :create
  owner "root"
  group "root"
  mode 0755
end

template "/etc/auto.master.d/qnap.autofs" do
  owner "root"
  group "root"
  mode 0644

  notifies :restart, "service[autofs]"
end

template "/etc/auto.qnap" do
  owner "root"
  group "root"
  mode 0644

  notifies :restart, "service[autofs]"
end

service "autofs" do
  action [:enable, :start]
  supports :start => true, :stop => true, :restart => true
end
