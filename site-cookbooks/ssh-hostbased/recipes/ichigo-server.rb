#
# Cookbook Name:: ssh-hostbased
# Recipe:: ichigo-server
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "scan host key" do
  user 'root'
  command <<EOS
rm -f /etc/ssh/ssh_known_hosts && \
ssh-keyscan -t rsa boxfish.unicus.ddo.jp,192.168.0.7 >> /etc/ssh/ssh_known_hosts
ssh-keyscan -t rsa starfish.unicus.ddo.jp,192.168.0.3 >> /etc/ssh/ssh_known_hosts
EOS
end

template "/etc/ssh/shosts.equiv" do
  source "ichigo/shosts.equiv.erb"
  owner "root"
  group "root"
  mode   0644
end
