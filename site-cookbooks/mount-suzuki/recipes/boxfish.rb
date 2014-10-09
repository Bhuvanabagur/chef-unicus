#
# Cookbook Name:: mount
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

haya_dir = '/suzuki/haya'

# make mount point
[haya_dir].each do |dir|
  directory dir do
    action :create
    owner "root"
    group "root"
    mode 0755
    recursive true
  end
end

mount "suzuki haya" do
  action [:enable, :mount]
  device '192.168.0.100:/haya'
  fstype 'nfs'
  mount_point haya_dir
  options 'rw,bg,hard,intr,rsize=4096,wsize=4096,timeo=300,nolock'
  pass 0
end
