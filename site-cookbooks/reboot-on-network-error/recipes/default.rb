#
# Cookbook Name:: reboot-on-network-error
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/home/pi/check-network.sh" do
  owner 'pi'
  group 'pi'
  mode  0755
end

cron "reboot-on-network-failure" do
  action :create
  minute "*"
  hour "*"

  user 'pi'
  command "/home/pi/check-network.sh"
end
