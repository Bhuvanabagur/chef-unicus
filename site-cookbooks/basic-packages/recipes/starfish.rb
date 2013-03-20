#
# Cookbook Name:: basic-packages
# Recipe:: starfish
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

["linux-tools"].each do |p|
  package p do
    action :upgrade
  end
end
