#
# Cookbook Name:: basic-packages
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w|binutils strace hping3|.each do |p|
  package p do
    action :upgrade
  end
end
