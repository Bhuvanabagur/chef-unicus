#
# Cookbook Name:: basic-packages
# Recipe:: starfish
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

development = %w!
systemtap
systemtap-sdt-dev
global
python-pip
!

[*development].each do |p|
  package p do
    action :upgrade
  end
end
