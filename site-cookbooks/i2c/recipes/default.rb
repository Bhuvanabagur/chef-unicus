#
# Cookbook Name:: i2c
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w! i2c-tools python-smbus !.each do |p|
  package p do
    action :upgrade
  end
end

group "i2c" do
  action [:modify]
  append true
  members 'pi'
end

script 'load i2c-bcm2708' do
  action :run
  interpreter 'bash'
  user 'root'
  code <<EOS
modprobe i2c-bcm2708
EOS
end
