#
# Cookbook Name:: mount
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

media_dir = "/suzuki/media"

# make mount point
directory media_dir do
  action :create
  owner "root"
  group "root"
  mode 0755
  recursive true
end

mount "suzuki media" do
  action [:enable, :mount]
  device 'suzuki.unicus.ddo.jp:/Multimedia'
  fstype 'nfs'
  mount_point media_dir
  options 'rw,bg,hard,intr,rsize=4096,wsize=4096,timeo=300,nolock'
  pass 0
end
