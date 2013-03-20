#
# Cookbook Name:: mount
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

media_dir = '/suzuki/media'
backup_dir = '/suzuki/backup'

# make mount point
[media_dir, backup_dir].each do |dir|
  directory dir do
    action :create
    owner "root"
    group "root"
    mode 0755
    recursive true
  end
end

mount "suzuki media" do
  action [:enable, :mount]
  device 'suzuki.unicus.ddo.jp:/Multimedia'
  fstype 'nfs'
  mount_point media_dir
  options 'rw,bg,hard,intr,rsize=4096,wsize=4096,timeo=300,nolock'
  pass 0
end

mount "suzuki backup" do
  action [:enable, :mount]
  device 'suzuki.unicus.ddo.jp:/Backup'
  fstype 'nfs'
  mount_point backup_dir
  options 'rw,bg,hard,intr,rsize=4096,wsize=4096,timeo=300,nolock'
  pass 0
end
