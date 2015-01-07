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
volatile_dir = '/suzuki/volatile'

# make mount point
[media_dir, backup_dir, volatile_dir].each do |dir|
  directory dir do
    action :create
    owner "root"
    group "root"
    mode 0755
    recursive true
  end
end

# mount "suzuki media" do
#   action :disable
#   device '192.168.0.100:/Multimedia'
#   fstype 'nfs'
#   mount_point media_dir
#   options 'rw,bg,hard,intr,rsize=4096,wsize=4096,timeo=300,nolock'
#   pass 0
# end
# 
# mount "suzuki backup" do
#   action :disable
#   device '192.168.0.100:/Backup'
#   fstype 'nfs'
#   mount_point backup_dir
#   options 'rw,bg,hard,intr,rsize=4096,wsize=4096,timeo=300,nolock'
#   pass 0
# end
# 
# mount "suzuki volatile" do
#   action :disable
#   device '192.168.0.100:/Volatile'
#   fstype 'nfs'
#   mount_point volatile_dir
#   options 'rw,bg,hard,intr,rsize=4096,wsize=4096,timeo=300,nolock'
#   pass 0
# end
